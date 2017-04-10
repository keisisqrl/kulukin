defmodule Kulukin.User do
  use Kulukin.Web, :model
  use Coherence.Schema

  schema "users" do
    field :name, :string
    field :email, :string
    field :admin, :boolean, default: false
    coherence_schema()

    has_many :containers, Kulukin.Container

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :admin] ++ coherence_fields())
    |> validate_required([:name, :email, :admin])
    |> validate_format(:email, ~r/@/)
    |> validate_coherence(params)
  end
end
