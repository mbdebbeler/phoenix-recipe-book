import React from 'react'

class FloatingActionButton extends React.Component {
  render () {
    return (
      <div>
        <button className="mdc-fab app-fab--absolute" aria-label="Add">
          <span className="mdc-fab__icon material-icons">add</span>
        </button>
      </div>
    )
  }
}

export default FloatingActionButton
