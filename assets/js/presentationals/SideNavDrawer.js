import React from 'react'
import {MDCDrawer} from "@material/drawer";

class SideNavDrawer extends React.Component {

  constructor(props) {
    super(props)
  }

  componentDidMount() {
  }
  componentDidUpdate() {
  }

  render() {
    return (
      <div>
        <aside className="mdc-drawer mdc-drawer--modal">
          <div className="mdc-drawer__content">
            <nav className="mdc-list">
              <a className="mdc-list-item mdc-list-item--activated" href="#" aria-current="page">
                <span className="mdc-list-item__text">View All</span>
              </a>
              <a className="mdc-list-item" href="#">
                <span className="mdc-list-item__text">Add a Recipe</span>
              </a>
            </nav>
          </div>
        </aside>
        <div className="mdc-drawer-scrim"></div>
      </div>
    )
  }
}

export default SideNavDrawer
