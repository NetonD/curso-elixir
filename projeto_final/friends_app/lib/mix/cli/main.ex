defmodule FriendsApp.CLI.Main do
  alias Mix.Shell.IO, as: Shell

    def start_app do
        Shell.cmd("clear")
        Shell.info("INICIANDO --[Friends App]--")
        show_message()
        Shell.prompt("Pressione ENTER para continuar...")
    end

    defp show_message do
        Shell.info("***********************************")
        Shell.info("* Seja bem vindo(a) ao Friends App")
        Shell.info("* ---")
        Shell.info("* App feito em Elixir")
        Shell.info("***********************************")
    end

end
