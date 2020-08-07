defmodule FriendsApp.DB.CSV do
  alias Mix.Shell.IO, as: Shell
  alias FriendsApp.CLI.Menu
  alias NimbleCSV.RFC4180, as: CSVparser
  alias FriendsApp.CLI.Friend
  alias FriendsApp.CLI.Menu.Choice

  def perform(chosen_menu_item) do
    case chosen_menu_item do
      %Menu{id: :create, label: _} -> create()
      %Menu{id: :read, label: _} -> Shell.info("Read")
      %Menu{id: :update, label: _} -> Shell.info("Update")
      %Menu{id: :delete, label: _} -> Shell.info("Delete")
    end
    Choice.start_choices()
  end

  defp create() do
    collect_data()
    |> Map.values()
    |> wrap_in_list
    |> CSVparser.dump_to_iodata()
    |> save_csv_file
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

  defp wrap_in_list(list) do
    [list]
  end

  defp save_csv_file(data) do
    File.write!("#{File.cwd!}/friends.csv",data,[:append])
  end
end
