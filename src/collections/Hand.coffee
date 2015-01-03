class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())

  # While hit can be called by both the player and the dealer, stand will only ever be 
  # called by the player because the dealer will hit until they win or lose. However, 
  # because this will impact the dealer hand, this function will only be executed on the
  # dealer's hand.
  stand: ->
    @reveal()
    @hit() while @minScore() < 21 and @minScore() < $('.score')[0].innerText
    return

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

