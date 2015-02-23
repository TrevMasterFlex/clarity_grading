# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".hidden").on "click", ->
    if $('#clarity_grade_set :checkbox:checked').length == 1 and $('#polish_grade_set :checkbox:checked').length == 1 and $('#symmetry_given_set :checkbox:checked').length == 1 and $('#symmetry_validation_set :checkbox:checked').length == 1
      $('#green_check').removeClass('no_display')
      $('#red_x').addClass('no_display')
    else if ($('#clarity_grade_set :checkbox:checked').length == 2 or $('#polish_grade_set :checkbox:checked').length == 2 or $('#symmetry_validation_set :checkbox:checked').length == 2) and ($('#clarity_grade_set :checkbox:checked').length >= 1 and $('#polish_grade_set :checkbox:checked').length >= 1 and $('#symmetry_validation_set :checkbox:checked').length >= 1 and $('#symmetry_given_set :checkbox:checked').length == 1 and $('#clarity_grade_set :checkbox:checked').length < 3 and $('#polish_grade_set :checkbox:checked').length < 3 and $('#symmetry_validation_set :checkbox:checked').length < 3)
      $('#green_check').addClass('no_display')
      $('#red_x').removeClass('no_display')
    else
      $('#green_check').addClass('no_display')
      $('#red_x').addClass('no_display')
