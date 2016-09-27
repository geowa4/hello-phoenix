# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HelloPhoenix.Repo.insert!(%HelloPhoenix.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias HelloPhoenix.Repo
alias HelloPhoenix.Person

Repo.insert! %Person{
  given_name: "Francis",
  family_name: "Underwood"
}

Repo.insert! %Person{
  given_name: "Claire",
  family_name: "Underwood"
}

Repo.insert! %Person{
  given_name: "Edward",
  family_name: "Meechum"
}

