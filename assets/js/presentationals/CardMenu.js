import React from 'react'
import {MDCMenu} from '@material/menu';


class CardMenu extends React.Component {
  constructor(props) {
    super(props)
  }

  componentDidMount() {
    this.menu = new MDCMenu(document.querySelector(".menu-root-" + this.props.id));
  }
  componentDidUpdate() {
    this.menu.open = this.props.isToggleOn;
  }

  render () {
    return (
      <div className="my-menu">
        <div className={"mdc-menu mdc-menu-surface menu-root-" + this.props.id}>
          <ul className="mdc-list" role="menu" aria-hidden="false" aria-orientation="vertical" tabIndex="-1">
            <li className="mdc-list-item" role="menuitem">
              <span className="mdc-list-item__text">Edit</span>
            </li>
            <li className="mdc-list-item" role="menuitem">
              <span className="mdc-list-item__text">Delete</span>
            </li>
          </ul>
        </div>
      </div>
    )
  }
}
export default CardMenu
