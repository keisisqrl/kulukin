defmodule Kulukin.Container do
  use Kulukin.Web, :model

  schema "containers" do
    field :name, :string
    field :location, :string
    belongs_to :user, Kulukin.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :location])
    |> validate_required([:name, :location])
  end
end
