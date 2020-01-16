defmodule Recipebook.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string
      add :servings, :string

      timestamps()
    end

  end
end
