import DS from 'ember-data';

export default DS.RESTAdapter.extend({
  host: 'http://localhost:3000/api/v1/open_australia_proxy',
  // namespace: 'api/v1/open_australia_proxy',
});
