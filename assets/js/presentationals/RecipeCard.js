import React from 'react'
class RecipeCard extends React.Component {
  render () {
    return (
    <div className="mdc-layout-grid__cell">
      <div className="mdc-card my-card-content">
        <div className="mdc-card__primary-action demo-card__primary-action" tabIndex="0">
          <div className="mdc-card__media mdc-card__media--16-9 demo-card__media"></div>
          <div className="demo-card__primary">
            <h2 className="demo-card__title mdc-typography mdc-typography--headline6">{this.props.title}</h2>
            <h3 className="demo-card__subtitle mdc-typography mdc-typography--subtitle2">Serves: {this.props.min_servings} to {this.props.max_servings}</h3>
          </div>
        </div>
        <div className="mdc-card__actions">
          <div className="mdc-card__action-buttons">
            <button className="mdc-button mdc-card__action mdc-card__action--button">  <span className="mdc-button__ripple"></span> View</button>
          </div>
        </div>
      </div>
    </div>

    )
  }
}
export default RecipeCard
