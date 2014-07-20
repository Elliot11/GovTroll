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

test('visiting /representatives/10562', function() {
  visit('/representatives/10562');
  andThen(function() {
    equal(currentPath(), 'representatives.show');
  });
});
