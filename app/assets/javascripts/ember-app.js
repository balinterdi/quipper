window.App = Ember.Application.create();

App.IndexRoute = Ember.Route.extend({
  model: function() {
    return Ember.$.getJSON('/timelines/baaz.json');
  }
});

App.TweetController = Ember.ObjectController.extend({
  biggerImageUrl: function() {
    return this.get('user.profile_image_url').replace('normal.', 'bigger.');
  }.property('user.profile_image_url')
});

Ember.Handlebars.helper('html', function(text, options) {
  return new Handlebars.SafeString(text.replace(/\n/g, '<br />'));
});


