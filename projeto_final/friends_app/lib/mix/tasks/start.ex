defmodule Mix.Tasks.Start do
  use Mix.Task
  @shortdoc "Inicia o app [FRIENDS APP]"

  def run(_), do: FriendsApp.CLI.Main.start_app()
end
