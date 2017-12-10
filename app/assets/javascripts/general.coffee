# Enable tooltips everywhere
$(document).on 'turbolinks:load', ->
  $('[data-toggle="tooltip"]').tooltip()
  FontAwesome.dom.i2svg()
  return
