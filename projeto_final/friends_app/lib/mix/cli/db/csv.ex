defmodule FriendsApp.DB.CSV do
  alias Mix.Shell.IO, as: Shell
  alias FriendsApp.CLI.Menu
  alias NimbleCSV.RFC4180, as: CSVparser
  alias FriendsApp.CLI.Friend
  alias FriendsApp.CLI.Menu.Choice

  def perform(chosen_menu_item) do
    case chosen_menu_item do
      %Menu{id: :create, label: _} -> create()
      %Menu{id: :read, label: _} -> read()
      %Menu{id: :update, label: _} -> update()
      %Menu{id: :delete, label: _} -> delete()
    end

    Choice.start_choices()
  end

  defp create() do
    collect_data()
    |> transform_collected()
    |> CSVparser.dump_to_iodata()
    |> save_csv_file()
  end

  defp transform_collected(struct) do
    struct
    |> Map.from_struct()
    |> Map.values()
    |> wrap_in_list
  end

  defp wrap_in_list(list) do
    [list]
  end

  defp save_csv_file(data, mode \\ :append) do
    Application.fetch_env!(:friends_app, :path)
    |> File.write!(data, [mode])
  end

  defp read() do
    get_struct_list_from_csv()
    |> show_friends()
  end

  defp get_struct_list_from_csv do
    read_csv_file()
    |> parse_csv_file_to_list()
    |> csv_list_to_struct_list()
  end

  defp read_csv_file do
    Application.fetch_env!(:friends_app, :path)
    |> File.read!()
  end

  defp parse_csv_file_to_list(csv_file) do
    csv_file
    |> CSVparser.parse_string(skip_headers: true)
  end

  defp csv_list_to_struct_list(csv_list) do
    csv_list
    |> Enum.map(fn [email, name, phone] ->
      %Friend{
        name: name,
        email: email,
        phone: phone
      }
    end)
  end

  defp show_friends(friends_list) do
    friends_list
    |> Scribe.console(data: [{"Nome", :name}, {"Email", :email}, {"Telefone", :phone}])
  end

  defp collect_data do
    %Friend{
      name: request_data("Digite o nome: "),
      email: request_data("Digite o email: "),
      phone: request_data("Digite o número: ")
    }
  end

  defp request_data(message) do
    Shell.prompt(message)
    |> String.trim()
  end

  defp delete() do
    Shell.cmd("clear")

    request_data("Digite o email do amigo:")
    |> search_friend_by_email()
    |> check_found_friend()
    |> confirm_deletion()
    |> delete_and_save()
  end

  defp search_friend_by_email(email) do
    Shell.info("Email : #{email}")
    get_struct_list_from_csv()
    |> Enum.find(:not_found,fn element-> element.email == email end)
  end

  defp check_found_friend(friend) do
    case friend do
      :not_found ->

        Shell.error("Amigo não encontrado.")
        Shell.prompt("Pressione ENTER para voltar...")
        Choice.start_choices()

      _ -> friend
    end
  end

  defp confirm_deletion(friend) do
    Shell.cmd("clear")
    Shell.info("Amigo a ser deletado:")
    show_friend(friend)

    case Shell.yes?("Confirmar eliminação desse amigo?") do
      true -> friend
      false -> :error
    end
  end

  defp show_friend(friend) do
    friend
    |> Scribe.print(data: [{"Nome", :name}, {"Email", :email}, {"Telefone", :phone}])
  end

  defp delete_and_save(friend) do
    case friend do
      :error ->
        Shell.error("Ação cancelada.")
        Shell.prompt("Pressione ENTER para continuar...")
      _ ->
        get_struct_list_from_csv()
        |> delete_friend_from_struct_list(friend)
        |> friend_list_to_csv()
        |> CSVparser.dump_to_iodata()
        |> save_csv_file(:write)
    end
  end

  defp delete_friend_from_struct_list(list_friends,friend) do
    list_friends
    |> Enum.reject(&(&1.email == friend.email))
  end

  defp friend_list_to_csv(list_friends) do
    list_friends
    |> Enum.map(fn item ->
      [item.email,item.name, item.phone]
    end)
  end

  defp update() do
    request_data("Digite o email do amigo que quer atualizar:")
    |> search_friend_by_email()
    |> check_found_friend()
    |> confirm_update()
    |> update_and_save()
  end

  defp confirm_update(friend) do
    Shell.cmd("clear")
    Shell.info("Amigo a ser atualizado:")
    show_friend(friend)

    case Shell.yes?("Confirmar atualização desse amigo?") do
      true -> friend
      false -> :error
    end
  end

  defp update_and_save(friend) do
    Shell.cmd("clear")
    Shell.info("-- Tela de atualização dos dados --")

    updated_friend = collect_data()

    get_struct_list_from_csv()
    |> delete_friend_from_struct_list(friend)
    |> friend_list_to_csv()
    |> CSVparser.dump_to_iodata()
    |> save_csv_file(:write)

    updated_friend
    |> transform_collected()
    |> CSVparser.dump_to_iodata()
    |> save_csv_file()
  end
end
