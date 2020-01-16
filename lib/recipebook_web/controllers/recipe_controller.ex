defmodule RecipebookWeb.RecipeController do
  use RecipebookWeb, :controller
  alias Recipebook.Binder

  def index(conn, _params) do
    recipes = Binder.list_recipes()
    render(conn, "index.json", recipes: recipes)
  end

  def show(conn, %{"id" => id}) do
    case Binder.get_recipe(id) do
      nil ->
        conn
        |> put_status(:not_found)
        |> text("Recipe not found")

        recipe ->
          render(conn, "show.json", recipe: recipe)
        end
      end
    end
