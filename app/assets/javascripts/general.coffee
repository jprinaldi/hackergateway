# Enable tooltips everywhere
$(document).on 'turbolinks:load', ->
  # Enable Google Analytics page tracking
  if typeof ga is "function"
    ga("set", "location", event.data.url)
    ga("send", "pageview")

  # Enable Bootstrap tooltips
  $('[data-toggle="tooltip"]').tooltip()

  # HACK: https://github.com/FortAwesome/Font-Awesome/issues/11924
  FontAwesome.dom.i2svg()

  return
