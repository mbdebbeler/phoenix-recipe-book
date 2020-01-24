defmodule Recipebook.Binder do
  @moduledoc """
  The Binder context.
  """

  import Ecto.Query, warn: false
  alias Recipebook.Repo

  alias Recipebook.Binder.Recipe

  @doc """
  Returns the list of recipes.

  ## Examples

      iex> list_recipes()
      [%Recipe{}, ...]

  """
  def list_recipes do
    Repo.all(Recipe)
  end

  @doc """
  Gets a single recipe.

  Raises `Ecto.NoResultsError` if the Recipe does not exist.

  ## Examples

      iex> get_recipe!(123)
      %Recipe{}

      iex> get_recipe!(456)
      ** (Ecto.NoResultsError)

  """
  def get_recipe(id), do: Repo.get(Recipe, id)
  def get_recipe!(id), do: Repo.get!(Recipe, id)

  @doc """
  Creates a recipe.

  ## Examples

      iex> create_recipe(%{field: value})
      {:ok, %Recipe{}}

      iex> create_recipe(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_recipe(data) do
    case Parser.parse_tokens(data) do
      {:ok, parsed_recipe} ->
        recipe_map = Map.from_struct(parsed_recipe)
        %Recipe{}
        |> Recipe.changeset(%{title: recipe_map.title, min_servings: recipe_map.servings.min, max_servings: recipe_map.servings.max})
        |> Repo.insert()
      {:error} ->
        {:error, Recipe.changeset(%Recipe{}, %{title: nil, min_servings: nil, max_servings: nil})}
    end
  end

  @doc """
  Updates a recipe.

  ## Examples

      iex> update_recipe(recipe, %{field: new_value})
      {:ok, %Recipe{}}

      iex> update_recipe(recipe, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_recipe(%Recipe{} = recipe, new_data) do
    case Parser.parse_tokens(new_data) do
      {:ok, parsed_recipe} ->
        recipe_map = Map.from_struct(parsed_recipe)
        recipe
        |> Recipe.changeset(%{title: recipe_map.title, min_servings: recipe_map.servings.min, max_servings: recipe_map.servings.max})
        |> Repo.update()
      {:error} ->
        {:error, Recipe.changeset(%Recipe{}, %{title: nil, min_servings: nil, max_servings: nil})}
    end

  end

  @doc """
  Deletes a Recipe.

  ## Examples

      iex> delete_recipe(recipe)
      {:ok, %Recipe{}}

      iex> delete_recipe(recipe)
      {:error, %Ecto.Changeset{}}

  """
  def delete_recipe(%Recipe{} = recipe) do
    Repo.delete(recipe)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking recipe changes.

  ## Examples

      iex> change_recipe(recipe)
      %Ecto.Changeset{source: %Recipe{}}

  """
  def change_recipe(%Recipe{} = recipe) do
    Recipe.changeset(recipe, %{})
  end
end
