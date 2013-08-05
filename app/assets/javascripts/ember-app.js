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

Ember.Handlebars.helper('html', function(tweet, options) {
  var text = tweet.get('text').replace(/\n/g, '<br />');
  var urlEntities = tweet.get('entities.urls');
  var withUrls = text;
  urlEntities.forEach(function(urlData) {
    //FIXME: This breaks when there are multiple urls
    //TODO:  For retweets entities.urls is empty. The indices are in entities.user_mentions.indices
    // and refer to the original tweet
    var start = urlData.indices[0];
    var end   = urlData.indices[1];
    withUrls = text.slice(0, start) + '<a href="' + urlData.expanded_url + '">' + urlData.display_url + '</a>' + text.slice(end);
  });
  return new Handlebars.SafeString(withUrls);
});


