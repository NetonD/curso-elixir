defmodule FriendsApp.Mix.CLI.MenuItens do
  alias FriendsApp.Mix.CLI.Menu

  def all, do: [
    %Menu{label: "Cadastrar amigo na lista", id: :create},
    %Menu{label: "Buscar amigo na lista", id: :read},
    %Menu{label: "Apagar amigo da lista", id: :delete},
    %Menu{label: "Atualizar dados amigo", id: :update},
  ]
end
