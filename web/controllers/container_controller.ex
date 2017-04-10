defmodule Kulukin.ContainerController do
  use Kulukin.Web, :controller
  alias Kulukin.Container

  plug Coherence.Authentication.Session, [protected: true] when
    action in [:edit, :update, :delete]
  plug :load_resource, model: Container, preload: :user
  plug :authorize_resource, model: Container, only: [:edit, :update, :delete]

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    changeset = Container.changeset(%Container{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"container" => container_params}) do
    user = conn.assigns[:current_user]
    changeset = Container.changeset(%Container{user_id: user.id}, container_params)

    case Repo.insert(changeset) do
      {:ok, _container} ->
        conn
        |> put_flash(:info, "Container created successfully.")
        |> redirect(to: container_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => _}) do
    render(conn, "show.html")
  end

  def edit(conn, %{"id" => _}) do
    changeset = Container.changeset(conn.assigns[:container])
    render(conn, "edit.html", changeset: changeset)
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