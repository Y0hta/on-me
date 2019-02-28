'user strict';

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

$(function () {
  $('#request-ajax')
    .on 'ajax:complete', (event) ->
      response = event.detail[0].response
      $('#updated-quantity-ajax').html(response)
})
