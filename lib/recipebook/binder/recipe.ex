defmodule Recipebook.Binder.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipes" do
    field :servings, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:title, :servings])
    |> validate_required([:title, :servings])
  end
end
