import Ember from 'ember';
import startApp from '../helpers/start-app';

var App;

module('Acceptance: Representatives', {
  setup: function() {
    App = startApp();
  },
  teardown: function() {
    Ember.run(App, 'destroy');
  }
});

test('visiting /representatives', function() {
  visit('/representatives');

  andThen(function() {
    equal(currentPath(), 'representatives.index');
  });
});

test('visiting /representatives/1', function() {
  visit('/representatives/1');
  andThen(function() {
    equal(currentPath(), 'representatives.show');
  });
});
