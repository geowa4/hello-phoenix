defmodule HelloPhoenix.Schema.Types do
  @moduledoc """
  """
  use Absinthe.Schema.Notation

  object :person do
    field :given_name, :string
    field :family_name, :string
  end
end
