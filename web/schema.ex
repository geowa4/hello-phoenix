defmodule HelloPhoenix.Schema do
  @moduledoc """
  """

  use Absinthe.Schema
  import_types HelloPhoenix.Schema.Types
  alias HelloPhoenix.PeopleResolver

  query do
    field :people, list_of(:person) do
      arg :family_name, :string
      resolve &PeopleResolver.all/2
    end
  end

  mutation do
    @desc "Create a person"
    field :create_person, type: :person do
      arg :given_name, non_null(:string)
      arg :family_name, non_null(:string)

      resolve &PeopleResolver.create/2
    end

    @desc "Change a person"
    field :change_person_name, type: :person do
      arg :given_name, non_null(:string)
      arg :family_name, non_null(:string)
      arg :new_given_name, :string
      arg :new_family_name, :string

      resolve &PeopleResolver.edit/2
    end
  end
end
