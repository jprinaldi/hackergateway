$(document).on 'turbolinks:load', ->
  # Enable Google Analytics page tracking
  if typeof ga is "function"
    ga("set", "location", event.data.url)
    ga("send", "pageview")

  # Enable Bootstrap tooltips
  $('[data-toggle="tooltip"]').tooltip()

  # Enable timeago
  $("time.timeago").timeago()

  return
