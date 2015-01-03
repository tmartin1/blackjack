// Generated by CoffeeScript 1.8.0
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

window.Hand = (function(_super) {
  __extends(Hand, _super);

  function Hand() {
    return Hand.__super__.constructor.apply(this, arguments);
  }

  Hand.prototype.model = Card;

  Hand.prototype.initialize = function(array, deck, isDealer) {
    this.deck = deck;
    this.isDealer = isDealer;
  };

  Hand.prototype.hit = function() {
    if (this.isDealer) {
      console.log('Dealer chooses to hit.');
    } else {
      console.log('Player chooses to hit.');
    }
    return this.add(this.deck.pop());
  };

  Hand.prototype.hasAce = function() {
    return this.reduce(function(memo, card) {
      return memo || card.get('value') === 1;
    }, 0);
  };

  Hand.prototype.minScore = function() {
    return this.reduce(function(score, card) {
      return score + (card.get('revealed') ? card.get('value') : 0);
    }, 0);
  };

  Hand.prototype.scores = function() {
    return [this.minScore(), this.minScore() + 10 * this.hasAce()];
  };

  Hand.prototype.reveal = function() {
    return this.each(function() {
      if (!arguments[0].attributes['revealed']) {
        arguments[0].flip();
      }
    });
  };

  Hand.prototype.redeal = function() {
    while (this.models.length > 0) {
      this.remove();
    }
  };

  return Hand;

})(Backbone.Collection);
