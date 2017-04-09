defmodule Kulukin.PageController do
  use Kulukin.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
