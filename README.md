mv-opsworks-cookbooks
=====================

Measured Voice app cookbooks for use with AWS Opsworks


## deployment::secrets_file recipe

Include this custom recipe to generate a too_many_secrets.rb file containing ENV variables for a Rails application.

### Custom JSON 

Add a 'secrets' section to the custom JSON in your stack configuration and specify the secrets file to be symlinked:

```
{
  "deploy": {
    "estuary": {
      "symlink_before_migrate" : {
        "config/too_many_secrets.rb": "config/too_many_secrets.rb"
      },
      "secrets" : {
        "rails_cookie_token" : "",
        "twitter_client_key" : "",
        "twitter_client_secret" : "",
        "twitter_oauth_token" : "",
        "twitter_oauth_secret" : "",
        "flickr_api_key" : "",
        "flickr_api_secret" : "",
        "youtube_api_key" : ""
      }
    }
  }
}
```

### Process the secrets file

Add this block to config/application.rb in your Rails app:

```
# Secrets should come from ENV variables,
# but you can store them in a handy secrets file if that's easier
secrets_file = File.expand_path('../too_many_secrets', __FILE__)
require secrets_file if File.exists?(secrets_file + '.rb')
```

### To Do

The secrets files follow a generic format, so the recipe should be able to set the ENV variable names solely on the contents of the secrets hash.
