defmodule Recipebook.BinderTest do
  use Recipebook.DataCase

  alias Recipebook.Binder

  describe "recipes" do
    alias Recipebook.Binder.Recipe

    @valid_attrs %{servings: "some servings", title: "some title"}
    @update_attrs %{servings: "some updated servings", title: "some updated title"}
    @invalid_attrs %{servings: nil, title: nil}

    def recipe_fixture(attrs \\ %{}) do
      {:ok, recipe} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Binder.create_recipe()

      recipe
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
      assert {:ok, %Recipe{} = recipe} = Binder.create_recipe(@valid_attrs)
      assert recipe.servings == "some servings"
      assert recipe.title == "some title"
    end

    test "create_recipe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Binder.create_recipe(@invalid_attrs)
    end

    test "update_recipe/2 with valid data updates the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{} = recipe} = Binder.update_recipe(recipe, @update_attrs)
      assert recipe.servings == "some updated servings"
      assert recipe.title == "some updated title"
    end

    test "update_recipe/2 with invalid data returns error changeset" do
      recipe = recipe_fixture()
      assert {:error, %Ecto.Changeset{}} = Binder.update_recipe(recipe, @invalid_attrs)
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
