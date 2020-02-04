import React from "react"
import RecipeCard from "../presentationals/RecipeCard"
import RecipeList from "./RecipeList"

class Recipes extends React.Component {

  constructor() {
    super();
    this.state = {recipes: []};
  }

  componentDidMount() {
    const url = 'http://localhost:4000/api/recipes'
    this.props.networking.get(url)
    .then((data) => {
      this.setState({recipes: data.data})
    })
    .catch(error => {
      console.log(error);
    });
  }

  render() {
    return (
      <div>
      <RecipeList recipes={this.state.recipes} />
      </div>
    )
  }
}

export default Recipes
