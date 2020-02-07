import React from 'react'

class FloatingActionButton extends React.Component {
  render() {
    return (
      <div>
        <button className="mdc-fab app-fab--absolute" aria-label="Favorite">
          <span className="mdc-fab__icon material-icons">favorite</span>
        </button>
      </div>
    )
  }

}

export default FloatingActionButton
