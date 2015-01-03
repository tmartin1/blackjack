class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': ->
      @model.get('playerHand').hit()
      @checkScore()
    'click .stand-button': ->
      @playDealer()
      @model.get('playerHand').hit = -> return # player cannot hit after standing

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  checkScore: ->
    if @model.get('playerHand').minScore() > 21
      @model.get('dealerHand').reveal()
      @restart('You lose!')

  playDealer: ->
    dealer = @model.get('dealerHand')
    player = @model.get('playerHand')
    dealer.reveal()
    dealer.hit() while dealer.minScore() < 21 and dealer.minScore() < player.minScore()
    if dealer.minScore() > 21
      @restart('You win!')
    else
      @restart('Dealer wins!')

  restart: ->
    alert(arguments[0])
    @render
    return

