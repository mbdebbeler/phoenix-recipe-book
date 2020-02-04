import React from "react";
import Adapter from "enzyme-adapter-react-16";
import App from "../js/app";
import Recipes from "../js/containers/Recipes";
import { render, unmountComponentAtNode } from "react-dom";
import { act } from "react-dom/test-utils";
import { mount, shallow, configure } from "enzyme";

configure({ adapter: new Adapter() });

test("Jest is configured correctly and can find the test files", () => {
  expect(true).toBe(true);
});

describe('App', () => {
  let wrapper;

  beforeEach(() => wrapper = shallow(<App />));

  it('should render a <div />', () => {
    const wrapper = shallow(<App />);
    expect(wrapper.find('div').length).toEqual(1);
  });

  it('should render the Recipes component', () => {
    expect(wrapper.containsMatchingElement(<Recipes />)).toEqual(true);
  });
});
