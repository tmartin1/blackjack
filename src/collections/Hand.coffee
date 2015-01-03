class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    if @isDealer
      console.log('Dealer chooses to hit.')
    else
      console.log('Player chooses to hit.')
    @add(@deck.pop())

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  reveal: ->
    @.each( -> 
      if !arguments[0].attributes['revealed']
        arguments[0].flip()
      return
      )

  redeal: ->
    @remove() while @models.length > 0
    return