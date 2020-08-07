defmodule FriendsApp.CLI.Menu.Itens do
  alias FriendsApp.CLI.Menu

  def all, do: [
    %Menu{label: "Cadastrar amigo na lista", id: :create},
    %Menu{label: "Buscar amigo na lista", id: :read},
    %Menu{label: "Apagar amigo da lista", id: :delete},
    %Menu{label: "Atualizar dados amigo", id: :update},
  ]
end
