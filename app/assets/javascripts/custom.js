'user strict';

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
});

// Clipboard
$(document).ready(function(){

  var clipboard = new Clipboard('.clipboard-btn');
  console.log(clipboard);

});

