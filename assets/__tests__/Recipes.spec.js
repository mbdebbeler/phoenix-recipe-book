import React from 'react';
import Recipes from '../js/containers/Recipes';
import Adapter from "enzyme-adapter-react-16";
import MockNetworking from '../mocks/MockNetworking';
import { mount, shallow, configure } from "enzyme";

configure({ adapter: new Adapter() });


describe('Recipes', () => {
  let wrapper;

  beforeEach(() => {
    let data = {"data":[{"max_servings":3,"min_servings":1,"title":"Ice Cubes"},{"max_servings":11,"min_servings":9,"title":"Esquites"}]};
    let networking = new MockNetworking(data);

    wrapper = shallow(<Recipes networking={networking} />)
  });

  it('should render a <div />', () => {
    expect(wrapper.find('div').length).toEqual(1);
  });
});
