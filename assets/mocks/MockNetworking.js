class MockNetworking {

  constructor(data) {
    this.data = data
  }

  get(url) {
    return new MockPromise(this.data);
  }
}

class MockPromise {

  constructor(data) {
    this.data = data
  }
  then(callback) {
    callback(this.data);
    return this;
  }

  catch(callback) {

  }
}

export default MockNetworking
