defmodule Kulukin.ContainerTest do
  use Kulukin.ModelCase

  alias Kulukin.Container

  @valid_attrs %{location: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Container.changeset(%Container{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Container.changeset(%Container{}, @invalid_attrs)
    refute changeset.valid?
  end
end
