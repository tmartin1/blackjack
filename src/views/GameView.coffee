class window.GameView extends Backbone.View
  template: _.template '
    <h1>Welcome to Blackjack</h2>
    <div id="menu" style="float:left; height:100%; width:150px;">
      <h2 style="margin-bottom:5px">Player</h2>
        <span>Wins: <span id="playerWins">0</span></span>
      <h2 style="margin-bottom:5px">Dealer</h2>
        <span>Wins: <span id="dealerWins">0</span></span>
    </div>
    <div id="gameBoard" style="margin:auto 20px"></div>
  '

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()

