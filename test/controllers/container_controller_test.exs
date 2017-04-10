defmodule Kulukin.ContainerControllerTest do
  use Kulukin.ConnCase

  alias Kulukin.Container
  @valid_attrs %{location: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, container_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing containers"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, container_path(conn, :new)
    assert html_response(conn, 200) =~ "New container"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, container_path(conn, :create), container: @valid_attrs
    assert redirected_to(conn) == container_path(conn, :index)
    assert Repo.get_by(Container, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, container_path(conn, :create), container: @invalid_attrs
    assert html_response(conn, 200) =~ "New container"
  end

  test "shows chosen resource", %{conn: conn} do
    container = Repo.insert! %Container{}
    conn = get conn, container_path(conn, :show, container)
    assert html_response(conn, 200) =~ "Show container"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, container_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    container = Repo.insert! %Container{}
    conn = get conn, container_path(conn, :edit, container)
    assert html_response(conn, 200) =~ "Edit container"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    container = Repo.insert! %Container{}
    conn = put conn, container_path(conn, :update, container), container: @valid_attrs
    assert redirected_to(conn) == container_path(conn, :show, container)
    assert Repo.get_by(Container, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    container = Repo.insert! %Container{}
    conn = put conn, container_path(conn, :update, container), container: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit container"
  end

  test "deletes chosen resource", %{conn: conn} do
    container = Repo.insert! %Container{}
    conn = delete conn, container_path(conn, :delete, container)
    assert redirected_to(conn) == container_path(conn, :index)
    refute Repo.get(Container, container.id)
  end
end
