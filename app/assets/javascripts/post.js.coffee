# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.GovTroll or= {}

class GovTroll.Post

  constructor: ->
    @$modal_container = $('#modal_container')
    @$gov_troll = $('.gov-troll')
    @bind()

  bind: ->
    @$gov_troll.on 'click', '.post-open-modal', @click
    @$gov_troll.on 'ajax:success', '.search-form', @open
    @$modal_container.on 'click', '.post .troll', @save
    @$modal_container.on 'ajax:success', '.post form', @save_success
    @$modal_container.on 'ajax:error', '.post form', @save_error

  click: (e) =>
    console.log 'new post: clicked!'
    $('.gov-troll .search-form').submit()

  open: (e, data, status, xhr) =>
    console.log 'post: open modal fired!'
    $('#modal_container').empty().append xhr.responseText
    $('#modal_container .post').modal 'show'

  save: (e) =>
    console.log 'post: save clicked!'
    $('#modal_container .post form').submit()

  save_success: (e, data, status, xhr) =>
    console.log 'post: save_success fired!'
    window.location.href = xhr.responseText

  save_error: (e, xhr, status, error) =>
    console.log 'post: save_error fired!'
    $('#modal_container .post form .modal-body').hide().empty().append(xhr.responseText).fadeIn 'fast'

create_post = ->
  window.GovTroll.post = new GovTroll.Post()

$(document).on 'ready page:load', create_post