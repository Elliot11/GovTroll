# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.GovTroll or= {}

class GovTroll.Post

  constructor: ->
    @$gov_troll = $('.gov-troll')
    @bind()

  bind: ->
    @$gov_troll.on 'click', '.post-modal', @click
    @$gov_troll.on 'ajax:success', '.post-form', @open

  click: (e) =>
    $('.gov-troll .post-form').submit()

  open: (e, data, status, xhr) =>
    console.log "post: open modal fired!"
    $('#modal_container').empty().append xhr.responseText
    $('#modal_container .post').modal 'show'

create_post = ->
  window.GovTroll.post = new GovTroll.Post()

$(document).on 'ready page:load', create_post