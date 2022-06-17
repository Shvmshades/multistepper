//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.en-GB.js
//= require_tree .


$(document).ready(function(){
  $('.datepicker').datepicker({
    format: 'dd/mm/yyyy'
  });
});
