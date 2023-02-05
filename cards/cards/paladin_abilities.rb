require_relative 'card.rb'

paladin_abilities = {}

class_colors = {
  rogue: 'Maroon',
  ranger: 'ForestGreen', 
  astrologist: 'DodgerBlue',
  monk: 'OrangeRed',
  paladin: 'GoldenRod'
}
=begin
paladin_abilities[:duel] = Card.new(
  title: "Duel",
  actions: [
    Card::Action.new(
      symbol: [:tap, :even],
      content: 'Pick a target. You and that target enter a duel where you and the target may not attack anyone other then each other. You cannot use this while in a duel.',
    ),
  ],
  color: class_colors[:paladin],
  flavour: '"A famous commander\'s signature thing."',
  type: 'Paladin Ability',
)
=end
paladin_abilities[:leading_charge] = Card.new(
  title: "Leading Charge",
  actions: [
    Card::Action.new(
      symbol: [:tap, :reactive, :face],
      content: 'When making an attack, **mark the target** and **choose an ally**. During **the ally\'s** next turn: they **gain an advatage** for all attacks they do **agaisnt the marked target**.',
    ),
  ],
  color: class_colors[:paladin],
  #flavour: '"A famous commander\'s signature thing."',
  type: 'Paladin Ability',
)

paladin_abilities[:taunt] = Card.new(
  title: "Taunt",
  actions: [
    Card::Action.new(
      symbol: [:tap, :reactive],
      content: 'When an attack is declared: redirect the attack toward yourself.',
    ),
  ],
  color: class_colors[:paladin],
  #flavour: '"A famous commander\'s signature thing."',
  type: 'Paladin Ability',
)


paladin_abilities[:strategic_planning] = Card.new(
  title: "Strategic Planning",
  actions: [
    Card::Action.new(
      symbol: [:tap, :joker],
      content: 'Swap 2 fate cards in your ally\'s hands of their choice.',
    ),
  ],
  color: class_colors[:paladin],
  #flavour: '"A famous commander\'s signature thing."',
  type: 'Paladin Ability',
)
paladin_abilities[:inspiring_speech] = Card.new(
  title: "Inspiring Speech",
  actions: [
    Card::Action.new(
      symbol: [:tap, :hearts],
      content: 'Recharge two ally\'s abilities.',
    ),
  ],
  color: class_colors[:paladin],
  #flavour: '"A famous commander\'s signature thing."',
  type: 'Paladin Ability',
)


Card.output('paladin_abilities', paladin_abilities);

