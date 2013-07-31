window.App = Ember.Application.create();

App.IndexRoute = Ember.Route.extend({
  model: function() {
    return Ember.$.getJSON('/timelines/baaz.json');
  }
});

