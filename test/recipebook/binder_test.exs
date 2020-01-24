defmodule Recipebook.BinderTest do
  use Recipebook.DataCase

  alias Recipebook.Binder

  describe "recipes" do
    alias Recipebook.Binder.Recipe

    @valid_recipe_filepath "assets/static/recipes/esquites.txt"
    @update_recipe_filepath "assets/static/recipes/mujaddara.txt"
    @invalid_recipe_filepath "assets/static/recipes/invalid.txt"

    def recipe_fixture() do
      data = File.read!(@valid_recipe_filepath)
      {:ok, recipe} = Binder.create_recipe(data)
      recipe
    end

    def generate_request_body(filepath) do
      File.read!(filepath)
    end

    test "list_recipes/0 returns all recipes" do
      recipe = recipe_fixture()
      assert Binder.list_recipes() == [recipe]
    end

    test "get_recipe!/1 returns the recipe with given id" do
      recipe = recipe_fixture()
      assert Binder.get_recipe!(recipe.id) == recipe
    end

    test "create_recipe/1 with valid data creates a recipe" do
      request_body = generate_request_body(@valid_recipe_filepath)
      assert {:ok, %Recipe{} = recipe} = Binder.create_recipe(request_body)
      assert recipe.servings == "1"
      assert recipe.title == "Mexican Corn Salad (Esquites)"
    end

    test "create_recipe/1 with invalid data returns error changeset" do
      request_body = generate_request_body(@invalid_recipe_filepath)
      assert {:error, %Ecto.Changeset{}} = Binder.create_recipe(request_body)
    end

    test "update_recipe/2 with valid data updates the recipe" do
      recipe = recipe_fixture()
      valid_request_body = generate_request_body(@update_recipe_filepath)
      assert {:ok, %Recipe{} = recipe} = Binder.update_recipe(recipe, valid_request_body)
      assert recipe.servings == "1"
      assert recipe.title == "Rice and Lentils with Crispy Onions (Mujaddara)"
    end

    test "update_recipe/2 with invalid data returns error changeset" do
      recipe = recipe_fixture()
      invalid_request_body = generate_request_body(@invalid_recipe_filepath)
      assert {:error, %Ecto.Changeset{}} = Binder.update_recipe(recipe, invalid_request_body)
      assert recipe == Binder.get_recipe!(recipe.id)
    end

    test "delete_recipe/1 deletes the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{}} = Binder.delete_recipe(recipe)
      assert_raise Ecto.NoResultsError, fn -> Binder.get_recipe!(recipe.id) end
    end

    test "change_recipe/1 returns a recipe changeset" do
      recipe = recipe_fixture()
      assert %Ecto.Changeset{} = Binder.change_recipe(recipe)
    end
  end
end
