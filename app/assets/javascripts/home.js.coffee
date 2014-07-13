# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.GovTroll or= {}

class GovTroll.Home

  constructor: ->
    @$gov_troll = $('.gov-troll')
    @bind()

  bind: ->
    @$gov_troll.on 'ajax:success', '.sign-up-modal', @open_sign_up

  open_sign_up: (e, data, status, xhr) =>
    console.log 'sign_up: open fired!'
    $('#modal_container').empty().append xhr.responseText
    $('#modal_container .sign_up').modal 'show'

create_home = ->
  window.GovTroll.home = new GovTroll.Home()

$(document).on 'ready page:load', create_home