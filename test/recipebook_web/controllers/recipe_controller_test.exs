defmodule RecipebookWeb.RecipeControllerTest do
  use RecipebookWeb.ConnCase
  alias Recipebook.Binder
  alias Recipebook.Binder.Recipe
  @create_recipe_filepath "assets/static/recipes/esquites.txt"
  @update_recipe_filepath "assets/static/recipes/mujaddara.txt"
  # @invalid_recipe_filepath "assets/static/recipes/invalid.txt"
  # @create_attrs %{title: "Recipe", servings: "1"}

  describe "index/2" do
    setup [:create_recipe]
    test "Responds with all recipes", %{conn: conn, recipe: recipe} do

      response =
        conn
        |> get(Routes.recipe_path(conn, :index))
        |> json_response(200)

      expected = %{
        "data" => [
          %{"title" => recipe.title, "servings" => "1"}
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

  describe "create/2" do
    setup [:generate_request_body]
    # test "Renders show when data is valid", %{conn: conn, data: data} do
    #   response =
    #        conn
    #        |> post("/api/recipes", body: data)
    #        |> json_response(201)
    #
    #
    #        expected = %{
    #          "data" =>
    #          %{"title" => "Ice Cubes", "servings" => "1"}
    #        }
    #
    #        assert response == expected
    #   end

      test "Renders error when data is invalid", %{conn: conn} do
        response =
          conn
          |> post(Routes.recipe_path(conn, :create))
          |> text_response(400)


          expected = "Could not create recipe"

          assert response == expected
        end
    end

  describe "delete/2" do

    setup [:create_recipe]

    test "delete/2 and responds with :ok if the recipe was deleted", %{conn: conn, recipe: recipe} do
      response =
        conn
        |> delete(Routes.recipe_path(conn, :delete, recipe.id))
        |> json_response(204)

        expected = %{
          "data" => [
            %{"title" => recipe.title, "servings" => recipe.servings}
          ]
        }
        assert response == expected
        refute Recipebook.Repo.get(Binder.Recipe, recipe.id)
      end

    end

    describe "update/2" do
      setup [:create_recipe]
      # test "Edits, and responds with the recipe show page if attributes are valid", %{conn: conn, recipe: %Recipe{} = recipe} do
      #   response =
      #     conn
      #     |> put(Routes.recipe_path(conn, :update, recipe), recipe: @update_attrs)
      #     |> json_response(200)
      #
      #
      #   expected = %{
      #     "data" => %{"servings" => "100", "title" => "Shaved Ice"}
      #   }
      #   assert response == expected
      # end

      test "Returns an error and does not edit the recipe if attributes are invalid", %{conn: conn, recipe: %Recipe{} = recipe} do
          response =
            conn
            |> put(Routes.recipe_path(conn, :update, recipe))
            |> text_response(400)

            expected = "Could not update recipe"

            assert response == expected
          end
    end

  defp create_recipe(_) do
    data = File.read!(@create_recipe_filepath)
    {:ok, recipe} = Binder.create_recipe(data)
    {:ok, recipe: recipe}
  end

  defp generate_request_body(_) do
    data = File.read!(@update_recipe_filepath)
    {:ok, data: data}
  end

end
