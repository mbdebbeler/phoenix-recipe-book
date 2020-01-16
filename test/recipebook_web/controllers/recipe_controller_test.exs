defmodule RecipebookWeb.RecipeControllerTest do
  use RecipebookWeb.ConnCase

  alias Recipebook.Binder
  @create_attrs %{title: "Ice Cubes", servings: "1"}

  describe "index/2" do
    setup [:create_recipe]
    test "index/2 responds with all recipes", %{conn: conn, recipe: recipe} do

      response = conn
      |> get(Routes.recipe_path(conn, :index))
      |> json_response(200)

      expected = %{
        "data" => [
          %{"title" => recipe.title, "servings" => recipe.servings}
        ]
      }
      assert response == expected
    end
  end

  describe "show/2" do
    setup [:create_recipe]
    test "Responds with recipe info if the recipe is found", %{conn: conn, recipe: recipe} do

      response =
        conn
        |> get(Routes.recipe_path(conn, :show, recipe.id))
        |> json_response(200)

        expected = %{"data" => %{"servings" => recipe.servings, "title" => recipe.title}}

        assert response == expected
      end
      test "Responds with a message indicating recipe not found", %{conn:  conn} do
        conn = get(conn, Routes.recipe_path(conn, :show, -1))

        assert text_response(conn, 404) =~ "Recipe not found"
      end
    end

  defp create_recipe(_) do
    {:ok, recipe} = Binder.create_recipe(@create_attrs)
    {:ok, recipe: recipe}
  end

end
