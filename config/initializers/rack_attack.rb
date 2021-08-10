# frozen_string_literal: true

# Rack::Attack is a rack middleware to protect your web app from bad clients.
# It allows safelisting, blocklisting, throttling, and tracking
# based on arbitrary properties of the request.
class Rack::Attack # rubocop:disable Style/ClassAndModuleChildren
  ### Configure Cache ###

  # If you don't want to use Rails.cache (Rack::Attack's default), then
  # configure it here.
  #
  # Note: The store is only used for throttling (not allowlisting and
  # denylisting). It must implement .increment and .write like
  # ActiveSupport::Cache::Store

  # Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  ### Throttle Spammy Clients ###

  # If any single client IP is making tons of requests, then they're
  # probably malicious or a poorly-configured scraper. Either way, they
  # don't deserve to hog all of the app server's CPU. Cut them off!
  #
  # Note: If you're serving assets through rack, those requests may be
  # counted by rack-attack and this throttle may be activated too
  # quickly. If so, enable the condition to exclude them from tracking.

  # Throttle all requests by IP (60rpm)
  #
  # Key: "rack::attack:#{Time.now.to_i/:period}:req/ip:#{req.ip}"
  throttle("req/ip", limit: 300, period: 5.minutes, &:ip)

  ### Prevent Brute-Force Login Attacks ###

  # The most common brute-force login attack is a brute-force password
  # attack where an attacker simply tries a large number of emails and
  # passwords to see if any credentials match.
  #
  # Another common method of attack is to use a swarm of computers with
  # different IPs to try brute-forcing a password for a specific account.

  # Throttle POST requests to /users/sign_in by IP address
  #
  # Key: "rack::attack:#{Time.now.to_i/:period}:sessions/ip:#{req.ip}"
  throttle("sessions/ip", limit: 5, period: 20.seconds) do |req|
    req.ip if req.path == "/users/sign_in" && req.post?
  end

  # Throttle POST requests to /users by IP address
  #
  # Key: "rack::attack:#{Time.now.to_i/:period}:registrations/ip:#{req.ip}"
  throttle("registrations/ip", limit: 5, period: 20.seconds) do |req|
    req.ip if req.path == "/users" && req.post?
  end

  # Throttle POST requests to /challenges/:id/solutions by IP address
  #
  # Key: "rack::attack:#{Time.now.to_i/:period}:solutions/ip:#{req.ip}"
  throttle("solutions/ip", limit: 5, period: 20.seconds) do |req|
    req.ip if %r{^/challenges/.+/solutions$}.match(req.path) && req.post?
  end

  ### Custom Throttle Response ###

  # By default, Rack::Attack returns an HTTP 429 for throttled responses,
  # which is just fine.
  #
  # If you want to return 503 so that the attacker might be fooled into
  # believing that they've successfully broken your app (or you just want to
  # customize the response), then uncomment these lines.
  # self.throttled_response = lambda do |env|
  #  [ 503,  # status
  #    {},   # headers
  #    ['']] # body
  # end
end
