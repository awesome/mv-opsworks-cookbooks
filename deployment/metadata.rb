maintainer "Measured Voice"
description "Adds configuration files to Rails"
version "0.1"
supports "ubuntu", ">= 8.10"

recipe "deployment::secrets_file", "Add secrets file to a Rails application"

depends "rails"

attribute "rails",
  :display_name => "Rails",
  :description => "Hash of Rails attributes",
  :type => "hash"
