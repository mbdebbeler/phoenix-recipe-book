# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:

# Binder.Repo.insert!(Binder.Recipe)

    # Recipebook.Repo.insert!(%Recipebook.Recipe{title: "Toast", servings: "1"})
    #

# recipes = [
#   %Recipebook.Binder.Recipe{title: "Toast", servings: "1"},
#   %Recipebook.Binder.Recipe{title: "Ice Cubes", servings: "2"},
#   %Recipebook.Binder.Recipe{title: "Boiling Water", servings: "3"},
# ]
#
# Enum.each(recipes, fn (recipe) -> Recipebook.Binder.Repo.insert(recipe) end)


defmodule Recipebook.DatabaseSeeder do
  alias Recipebook.Repo
  alias Recipebook.Link

  @titles_list ["Toast", "Ice Cubes", "Boiling Water"]
  @servings_list ["99", "1", "5"]

  def insert_recipe do
    Repo.insert! %Binder.Recipe{
      title: (@titles_list |> Enum.random()),
      servings: (@servings_list |> Enum.random())
    }
  end

  def clear do
    Repo.delete_all()
  end
end


# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
