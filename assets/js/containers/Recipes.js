import React from "react"
import RecipeCard from "../presentationals/RecipeCard"

class Recipes extends React.Component {

  constructor() {
    super();
    this.state = {recipes: []};
  }

  componentDidMount() {
    const url = 'http://localhost:4000/api/recipes'
    fetch(url)
      .then(res => res.json())
      .then((data) => {
        this.setState({recipes: data.data})
      })
      .catch(error => {
        console.log(error);
      });
  }

  render() {
    const recipes = this.state.recipes.map((recipe, index) =>
      <RecipeCard
        key = { index }
        title = { recipe.title }
        min_servings = { recipe.min_servings }
        max_servings = { recipe.max_servings }
      />
    )
    return (
      <div>
      {recipes}
      </div>
    )
  }
}

export default Recipes
