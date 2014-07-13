# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.GovTroll or= {}

class GovTroll.Modal

  constructor: ->
    @$modal_container = $('#modal_container')
    @bind()

  bind: ->
    @$modal_container.on 'hidden.bs.modal', @clear

  clear: ->
    console.log 'modal: clear fired!'
    $('#modal_container').empty()

  fill: (content) =>
    console.log 'modal: fill fired!'
    @$modal_container.empty().append content

create_modal = ->
  window.GovTroll.modal = new GovTroll.Modal()

$(document).on 'page:load', create_modal
$(document).ready create_modal