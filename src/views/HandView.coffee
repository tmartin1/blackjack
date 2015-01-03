class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    # if @collection.scores()[0] is 21 then @win()
    if @collection.scores()[0] > 21 then @bust()
    @$('.score').text @collection.scores()[0]

  bust: ->
    if @collection.isDealer
      console.log('You win!')
    else
      console.log('You Lose!')
    return

  # win: ->
  #   if @collection.isDealer
  #     console.log('Dealer wins!')
  #   else
  #     console.log('You win!')
  #   return