defmodule RecipebookWeb.PageControllerTest do
  use RecipebookWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "<title>Recipe Box</title>"
  end
end
