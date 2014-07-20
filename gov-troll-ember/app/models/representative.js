import DS from 'ember-data';

export default DS.Model.extend({
  last_name: DS.attr('string'),
  first_name: DS.attr('string'),
  member_id: DS.attr('number'),
  name: DS.attr('string'),
  party: DS.attr('string'),
  constituency: DS.attr('string')
});
