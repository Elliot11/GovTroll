import Ember from 'ember';

var Router = Ember.Router.extend({
  location: GovTrollEmberENV.locationType
});

Router.map(function() {
  this.resource('representatives', function ()  {
    this.route('show', {path: '/:representative_id'});
  });
});

export default Router;
