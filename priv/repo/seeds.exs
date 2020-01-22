# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:

# Binder.Repo.insert!(Binder.Recipe)

defmodule Recipebook.DatabaseSeeder do
  alias Recipebook.Repo
  alias Recipebook.Binder.Recipe

  @titles_list ["Toast", "Ice Cubes", "Boiling Water"]
  @servings_list ["99", "1", "5"]

  def insert_recipe do
    Repo.insert! %Recipe{
      title: (@titles_list |> Enum.random()),
      servings: (@servings_list |> Enum.random())
    }
  end

end

Recipebook.DatabaseSeeder.insert_recipe()
Recipebook.DatabaseSeeder.insert_recipe()
Recipebook.DatabaseSeeder.insert_recipe()
