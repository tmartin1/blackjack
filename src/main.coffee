blackjackApp = new App()
new GameView(model: blackjackApp).$el.appendTo 'body'
new AppView(model: blackjackApp).$el.appendTo '#gameBoard'
