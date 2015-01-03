class window.AppView extends Backbone.View
  template: _.template '
    <div class="dealer-hand-container"></div><br>
    <div class="player-hand-container"></div><br>
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
  '

  events:
    'click .hit-button': ->
      @model.get('playerHand').hit()
      @model.checkScore()
    'click .stand-button': ->
      @model.playDealer()

  initialize: ->
    @model.on 'change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

