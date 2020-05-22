# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy
# For further information see the following documentation
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy

Rails.application.config.content_security_policy do |policy|
  policy.default_src :none
  policy.connect_src :self,
                     "kit-pro.fontawesome.com"
  policy.font_src "fonts.gstatic.com"
  policy.frame_src "w.soundcloud.com"
  policy.img_src :self,
                 :data,
                 "secure.gravatar.com",
                 "https://i.imgur.com/ngzLRJT.png",
                 "https://i.imgur.com/jWuemiu.png",
                 "https://i.imgur.com/hufZt2u.png"
  policy.manifest_src :self,
                      "hackergateway.cloudflareaccess.com"
  policy.script_src :self,
                    "static.cloudflareinsights.com",
                    "kit.fontawesome.com",
                    "kit-pro.fontawesome.com",
                    "'sha256-pDz4vhGBfDjPcpVpEEbETB8WCXjegQKQKK7W7YkV5po='",
                    "'sha256-2G7ydRU40Z+O1K3aJl1RO6ptAKOjSQyfznSXqWNk7n4='"
  policy.style_src :self,
                   :data,
                   "fonts.googleapis.com",
                   "'sha256-BOZ1LCc/+axZqSnyr/B1TM044LAzTlNLcIqziXpcNsE='",
                   "'sha256-ixVUGs3ai0rMA0pgIVBN0KVlYbQip7/5SGmnUwJPNqE='",
                   "'sha256-voXja0NHK+kj/CO6kVFGewEz+qyDFbxR+WW6e9vfN3o='",
                   "'sha256-47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU='",
                   "'sha256-ailVKDfjFoOAPKgaCr9c3kGwJ7vcsb6WJkg4lxE4FN8='",
                   "'sha256-XsFlCmmILSp2LI6LZSVDFN6EMyGZiJcu0iLGHsZ+b+I='"

  # If you are using webpack-dev-server then specify webpack-dev-server host
  policy.connect_src :self, :https, "http://localhost:3035", "ws://localhost:3035" if Rails.env.development?

  # Specify URI for violation reports
  # policy.report_uri "/csp-violation-report-endpoint"
end

# If you are using UJS then enable automatic nonce generation
# Rails.application.config.content_security_policy_nonce_generator = -> request { SecureRandom.base64(16) }

# Set the nonce only to specific directives
# Rails.application.config.content_security_policy_nonce_directives = %w(script-src)

# Report CSP violations to a specified URI
# For further information see the following documentation:
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
# Rails.application.config.content_security_policy_report_only = true
