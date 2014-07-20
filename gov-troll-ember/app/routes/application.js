import Ember from 'ember';

export default Ember.Route.extend({
  controllerName: 'representatives',
  model: function(){
    return this.store.find('representative');
  }
});
