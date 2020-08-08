defmodule Mix.Tasks.Utils.AddFakeFriend do
  use Mix.Task
  alias NimbleCSV.RFC4180, as: CSVparser
  alias FriendsApp.CLI.Friend
  @shortdoc "Create fake friends"
  def run(_) do
    Faker.start()

    create_fakelist_friends([], 50)
    |> CSVparser.dump_to_iodata()
    |> save_csv_file()

  end

  defp create_fakelist_friends(list,count) when count <= 1 do
    list ++ [fake_friend_generator()]
  end

  defp create_fakelist_friends(list,count) do
    list ++ [fake_friend_generator()] ++ create_fakelist_friends(list, count-1)
  end

  defp fake_friend_generator do
    %Friend{
      name: Faker.Person.PtBr.name(),
      email: Faker.Internet.email(),
      phone: Faker.Phone.EnUs.phone()
    }
    |> Map.from_struct()
    |> Map.values()
  end

  defp save_csv_file(data)do
    File.write!("#{File.cwd!}/friends.csv",data,[:append])
  end

end
