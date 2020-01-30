defmodule Recipebook.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string
      add :min_servings, :integer
      add :max_servings, :integer

      timestamps()
    end

  end
end
