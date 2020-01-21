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

  def create(conn, %{"title" => _title, "servings" => _servings} = recipe_params) do
    case Binder.create_recipe(recipe_params) do
      {:ok, recipe} ->
        conn
        |> put_status(:created)
        |> render("show.json", recipe: recipe)
      {:error, _changeset} ->
        conn
        |> put_status(:bad_request)
        |> text("Could not create recipe")
    end
  end

  def delete(conn, %{"id" => id}) do
    recipe = Binder.get_recipe!(id)
    recipes = Binder.list_recipes()
    case Binder.delete_recipe(recipe) do
        {:ok, _recipe} ->
          conn
          |> put_status(:no_content)
          |> render("index.json", recipes: recipes)
        {:error, _changeset} ->
          conn
          |> put_status(:bad_request)
          |> text("Could not delete recipe")
    end
  end

end
