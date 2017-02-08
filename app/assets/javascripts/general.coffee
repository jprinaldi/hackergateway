# Enable tooltips everywhere
$(document).on 'turbolinks:load', ->
  $('[data-toggle="tooltip"]').tooltip()
  return
