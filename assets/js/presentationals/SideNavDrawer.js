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
                <i className="material-icons mdc-list-item__graphic" aria-hidden="true">inbox</i>
                <span className="mdc-list-item__text">Inbox</span>
              </a>
              <a className="mdc-list-item" href="#">
                <i className="material-icons mdc-list-item__graphic" aria-hidden="true">send</i>
                <span className="mdc-list-item__text">Outgoing</span>
              </a>
              <a className="mdc-list-item" href="#">
                <i className="material-icons mdc-list-item__graphic" aria-hidden="true">drafts</i>
                <span className="mdc-list-item__text">Drafts</span>
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
