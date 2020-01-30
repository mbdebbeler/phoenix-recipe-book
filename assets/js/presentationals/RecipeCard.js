import React from "react"
class RecipeCard extends React.Component {

  render() {
    return (
      <div className="card">
      <div className="card-content">
      <div className="media">
      <div className="media-content">
      <p className="title is-4">{this.props.title}</p>
      <p className="subtitle is-6">{this.props.min_servings}</p>
      <p className="subtitle is-6">By {this.props.max_servings}</p>
      </div>
      </div>
      </div>
      </div>
    )
  }
}
export default RecipeCard
