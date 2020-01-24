# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $("#measurement_type")[0].selectedIndex = 0;
  $('#measurement').parent().hide()
  measurement_type = $('#measurement_type').html()

  measurements = $('#measurement').html()

  type = $('#measurement_type :selected').text()
  escaped_measurement_type = type.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
  options = $(measurements).filter("optgroup[label='#{escaped_measurement_type}']").html()

  if options
    $('#measurement').html(options)
    $('#measurement').parent().show()
  else
    $('#measurement').empty()
    $('#measurement').parent().hide()

  $('#measurement_type').change ->
    measurement_type = $('#measurement_type :selected').text()
    escaped_measurement_type = measurement_type.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(measurements).filter("optgroup[label='#{escaped_measurement_type}']").html()

    if options
      $('#measurement').html(options)
      $('#measurement').parent().show()
    else
      $('#measurement').empty()
      $('#measurement').parent().hide()
