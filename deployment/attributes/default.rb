default[:deploy] = {}
node[:deploy].each do |application, deploy|
  default[:deploy][application][:secrets] = {}

  default[:deploy][application][:secrets][:rails_cookie_token] = ""

  default[:deploy][application][:secrets][:twitter_client_key] = ""
  default[:deploy][application][:secrets][:twitter_client_secret] = ""

  default[:deploy][application][:secrets][:flickr_api_key] = ""
  default[:deploy][application][:secrets][:flickr_api_secret] = ""

  default[:deploy][application][:secrets][:youtube_api_key] = ""
end

default[:deploy][:user] = "deploy"
default[:deploy][:group] = "nginx"
