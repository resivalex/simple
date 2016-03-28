$(document).on 'ajax:success', 'form:first-of-type', (e, data) ->
  $('.table').append(data)


$(document).on 'ajax:success', '.button_to', ->
  $(@).closest('tr').remove()