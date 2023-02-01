require_relative 'card.rb'

paladin_abilities = {}

class_colors = {
  rogue: 'Maroon',
  ranger: 'ForestGreen', 
  astrologist: 'DodgerBlue',
  monk: 'OrangeRed',
  paladin: 'GoldenRod'
}

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

paladin_abilities[:duck_and_weave] = Card.new(
  title: "Duck and Weave",
  actions: [
    Card::Action.new(
      symbol: [:tap, :diamonds],
      content: ' Ignore up to the card played worth of damage from a **reposte**.',
    ),
  ],
  color: class_colors[:rogue],
  flavour: '"Missed me"',
  type: 'Rogue Ability',
)

paladin_abilities[:surgical_strike] = Card.new(
  title: "Surgical Strike",
  actions: [
    Card::Action.new(
      symbol: [:tap, :spades],
      content: '(less then 5) Replace a weapon\'s damage with the value of the card played. Only affects the current attack.',
    ),
  ],
  color: class_colors[:rogue],
  #flavour: '"Missed me"',
  type: 'Rogue Ability',
)

paladin_abilities[:down_they_alleys] = Card.new(
  title: "Down the Alleys",
  actions: [
    Card::Action.new(
      symbol: [:diamonds],
      content: '(odd) When travelling inside a settlement, after an encounter has been revealed: you may choose to either discard the encounter and draw another one or skip the encounter.',
    ),
  ],
  color: class_colors[:rogue],
  #flavour: '"Missed me"',
  type: 'Rogue Ability',
)

paladin_abilities[:spot] = Card.new(
  title: "Spot",
  actions: [
    Card::Action.new(
      symbol: [:hearts],
      content: '(face) Mark a target. Choose up to one dice to reroll on each attack agaisnt this target. You can only have one target marked at a time. Lasts until 3 rerolls or the end of combat.',
    ),
  ],
  color: class_colors[:ranger], 
  #flavour: '"Missed me"',
  type: 'Ranger Ability',
)
paladin_abilities[:flexible_shooter] = Card.new(
  title: "Flexible Shooter",
  actions: [
    Card::Action.new(
      #symbol: [:hearts],
      content: 'You can deal reposte damage with any ranged weapon.',
    ),
  ],
  color: class_colors[:ranger], 
  #flavour: '"Missed me"',
  type: 'Ranger Ability',
)

paladin_abilities[:scouting_ahead] = Card.new(
  title: "Scouting Ahead",
  actions: [
    Card::Action.new(
      symbol: [:diamonds],
      content: '(even) When travelling outside of a settlement, before the next encounter: reveal 2 encounters and pick 1. Discard the other.',
    ),
  ],
  color: class_colors[:ranger], 
  #flavour: '"Missed me"',
  type: 'Ranger Ability',
)

paladin_abilities[:healing_salve_recipe] = Card.new(
  title: "Healing Salve Recipe",
  actions: [
    Card::Action.new(
      symbol: [:diamonds, :hearts],
      content: '(each suit) Healberry Herb, Cloth.',
    ),
  ],
  color: class_colors[:ranger], 
  flavour: '"*Don\'t* eat the berries"',
  type: 'Ranger Recipe',
)

paladin_abilities[:recast] = Card.new(
  title: "Recast",
  actions: [
    Card::Action.new(
      symbol: [:tap, :hearts],
      content: '(less then or equal to your max blood roll) Replace the blood roll with the value of the card played and reroll any other associated dice with a spell you cast.',
    ),
  ],
  color: class_colors[:astrologist],
  #flavour: '"Missed me"',
  type: 'Astrologist Ability',
)
paladin_abilities[:focused_cast] = Card.new(
  title: "Focused Cast",
  actions: [
    Card::Action.new(
      symbol: [:tap],
      content: 'Upgrade the blood dice for one spell you cast.',
    ),
  ],
  color: class_colors[:astrologist],
  #flavour: '"Missed me"',
  type: 'Astrologist Ability',
)

paladin_abilities[:focused_cast] = Card.new(
  title: "Focused Cast",
  actions: [
    Card::Action.new(
      symbol: [:tap],
      content: 'Upgrade the blood dice for one spell you cast.',
    ),
  ],
  color: class_colors[:astrologist],
  #flavour: '"Missed me"',
  type: 'Astrologist Ability',
)

paladin_abilities[:change_of_fate] = Card.new(
  title: "Change of Fate",
  blood: 1,
  actions: [
    Card::Action.new(
      symbol: [:blood],
      content: 'Swap 1 card with a willing player.',
    ),
  ],
  color: class_colors[:astrologist],
  #flavour: '"Missed me"',
  type: 'Astrologist Ability',
)

paladin_abilities[:palm_reading] = Card.new(
  title: "Palm Reading",
  blood: 1,
  actions: [
    Card::Action.new(
      symbol: [:blood],
      content: 'Discard a willing players hand and replace it with new cards drawn.',
    ),
  ],
  color: class_colors[:astrologist],
  #flavour: '"Missed me"',
  type: 'Astrologist Ability',
)

Card.output('paladin_abilities', paladin_abilities);

