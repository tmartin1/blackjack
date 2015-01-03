class window.App extends Backbone.Model
  initialize: ->
    @set
      playerWins: 0
      dealerWins: 0
    @render()

  render: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  checkScore: ->
    if @attributes.playerHand.minScore() > 21
      @attributes.dealerHand.reveal()
      @restart('You lose!')

  playDealer: ->
    dealer = @attributes.dealerHand
    player = @attributes.playerHand
    dealer.reveal()
    dealer.hit() while dealer.minScore() < 21 and dealer.minScore() < player.minScore()
    if dealer.minScore() > 21 then @restart('You win!', true)
    else @restart('Dealer wins!')
    return

  restart: (message, playerWin) ->
    alert(message)
    @render()
    @rescore(playerWin)
    return

  rescore: (playerWin) ->
    if playerWin
      $('#playerWins').text(++@attributes.playerWins)
    else 
      $('#dealerWins').text(++@attributes.dealerWins)
    return
