import React from 'react'
import RecipeCard from '../presentationals/RecipeCard'

class RecipeList extends React.Component {
  render () {
    const recipes = this.props.recipes.map(function (recipe, index) {
      return <RecipeCard
        key = { index }
        title = { recipe.title }
        min_servings = { recipe.min_servings }
        max_servings = { recipe.max_servings }
      />
    })

    return (
      <div className="mdc-layout-grid__inner">
        {recipes}
      </div>
    )
  }
}

export default RecipeList
