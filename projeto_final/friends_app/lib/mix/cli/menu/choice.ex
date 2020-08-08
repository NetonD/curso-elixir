defmodule FriendsApp.CLI.Menu.Choice do
  alias Mix.Shell.IO, as: Shell
  alias FriendsApp.DB.CSV

  def start_choices do
    Shell.cmd("clear")
    Shell.info("Escolha uma opçao:")

    menu_itens = FriendsApp.CLI.Menu.Itens.all()
    find_menu_by_index = &Enum.at(menu_itens, &1, :error)

    menu_itens
    |> Enum.map(& &1.label)
    |> display_options()
    |> generate_question()
    |> Shell.prompt()
    |> parse_answer()
    |> find_menu_by_index.()
    |> check_validit()
    |> confirm_choice()
    |> CSV.perform()
  end

  defp display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index} - #{option}")
    end)

    options
  end

  defp generate_question(options) do
    question =
      1..Enum.count(options)
      |> Enum.join(",")
      |> (fn lista -> "Qual é a opção escolhida? [#{lista}]" end).()

    question
  end

  defp parse_answer(answer) do
    case Integer.parse(answer) do
      :error -> invalid_option()
      {option, _} -> option - 1
    end
  end

  def check_validit(chosen_option) do
    case chosen_option do
      :error -> invalid_option()
      _ -> chosen_option
    end
  end

  def confirm_choice(chosen_option) do
    Shell.cmd("clear")
    Shell.info("Você escolheu: [#{chosen_option.label}]")

    case Shell.yes?("Confimar?") do
      true -> chosen_option
      false -> start_choices()
    end
  end

  def invalid_option do
    Shell.error("Opção inválida")
    Shell.prompt("Pressione ENTER...")
    start_choices()
  end
end
