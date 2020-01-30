defmodule Recipebook.Binder.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipes" do
    field :min_servings, :integer
    field :max_servings, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:title, :min_servings, :max_servings])
    |> validate_required([:title])
  end
end
