defmodule Kulukin.ContainerController do
  use Kulukin.Web, :controller

  plug Coherence.Authentication.Session, [protected: true] when
    not (action in [:index, :show])
  plug :authorize_resource when action in [:edit, :update, :delete]
  plug :require_authorized when action in [:edit, :update, :delete]

  alias Kulukin.Container

  def index(conn, _params) do
    containers = Repo.all(Container)
    render(conn, "index.html", containers: containers)
  end

  def new(conn, _params) do
    changeset = Container.changeset(%Container{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"container" => container_params}) do
    user = conn.assigns[:current_user]
    container_params = Map.put_new(container_params, :user, user)
    changeset = Container.changeset(%Container{}, container_params)

    case Repo.insert(changeset) do
      {:ok, _container} ->
        conn
        |> put_flash(:info, "Container created successfully.")
        |> redirect(to: container_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    container = Repo.get!(Container, id)
    render(conn, "show.html", container: container)
  end

  def edit(conn, %{"id" => id}) do
    container = Repo.get!(Container, id)
    changeset = Container.changeset(container)
    render(conn, "edit.html", container: container, changeset: changeset)
  end

  def update(conn, %{"id" => id, "container" => container_params}) do
    container = Repo.get!(Container, id)
    changeset = Container.changeset(container, container_params)

    case Repo.update(changeset) do
      {:ok, container} ->
        conn
        |> put_flash(:info, "Container updated successfully.")
        |> redirect(to: container_path(conn, :show, container))
      {:error, changeset} ->
        render(conn, "edit.html", container: container, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    container = Repo.get!(Container, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(container)

    conn
    |> put_flash(:info, "Container deleted successfully.")
    |> redirect(to: container_path(conn, :index))
  end
end
