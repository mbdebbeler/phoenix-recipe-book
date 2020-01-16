defmodule RecipebookWeb.RecipeView do
  use RecipebookWeb, :view

  def render("index.json", %{recipes: recipes}) do
    %{data: render_many(recipes, RecipebookWeb.RecipeView, "recipe.json")}
  end

  def render("show.json", %{recipe: recipe}) do
    %{data: render_one(recipe, RecipebookWeb.RecipeView, "recipe.json")}
  end

  def render("recipe.json", %{recipe: recipe}) do
    %{title: recipe.title, servings: recipe.servings}
  end

end
