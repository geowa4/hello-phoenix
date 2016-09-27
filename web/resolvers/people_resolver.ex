defmodule HelloPhoenix.PeopleResolver do
  @moduledoc """
  """
  alias HelloPhoenix.Person
  alias HelloPhoenix.Repo
  require Logger
  import Ecto.Query

  def all(args, _info) do
    if Map.has_key?(args, :family_name) do
      query = from p in Person,
        where: p.family_name == ^Map.get(args, :family_name),
        select: p
      {:ok, Repo.all(query)}
    else
      {:ok, Repo.all(Person)}
    end
  end

  def create(args, _info) do
    Person.changeset(%Person{}, args)
    |> Repo.insert
  end

  def edit(%{
    family_name: family_name, given_name: given_name,
    new_family_name: new_family_name, new_given_name: new_given_name
  }, _info) do
    query = from p in Person,
      where: p.family_name == ^family_name and p.given_name == ^given_name,
      select: p
    query |> first |> Repo.one
    |> Person.changeset(%{
        family_name: new_family_name, given_name: new_given_name
      })
    |> Repo.update
  end
end
