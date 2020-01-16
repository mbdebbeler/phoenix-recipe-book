defmodule RecipebookWeb.PageController do
  use RecipebookWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
