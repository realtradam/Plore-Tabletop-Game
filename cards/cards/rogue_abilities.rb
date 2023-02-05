require_relative 'card.rb'

rogue_abilities = {}

class_colors = {
  rogue: 'Maroon',
  ranger: 'ForestGreen', 
  astrologist: 'DodgerBlue',
  monk: 'OrangeRed',
  paladin: 'GoldenRod'
}

rogue_abilities[:weak_point] = Card.new(
  title: "Weak Point",
  actions: [
    Card::Action.new(
      symbol: [:joker, :reactive],
      content: 'After rolling a successful attack: deal extra damage equal to your weapon damage if at least one die rolled is the max possible number that can be rolled.',
    ),
  ],
  color: class_colors[:rogue],
  #flavour: '"A famous commander\'s signature thing."',
  type: 'Rogue Ability',
)

rogue_abilities[:interruption] = Card.new(
  title: "Interruption",
  actions: [
    Card::Action.new(
      symbol: [:clubs, :reactive],
      content: 'Cancel the effect an ability that is being attempted to be activated.',
    ),
  ],
  color: class_colors[:rogue],
  #flavour: '"A famous commander\'s signature thing."',
  type: 'Rogue Ability',
)

rogue_abilities[:lucky_sense] = Card.new(
  title: "Lucky Sense",
  actions: [
    Card::Action.new(
      symbol: [:tap],
      content: 'Peek the top card of your fate deck.',
    ),
  ],
  color: class_colors[:rogue],
  #flavour: '"A famous commander\'s signature thing."',
  type: 'Rogue Ability',
)

rogue_abilities[:quick_attack] = Card.new(
  title: "Quick Attack",
  actions: [
    Card::Action.new(
      symbol: [:greater, :tap],
      content: 'Recharge all equipped light weapons.',
    ),
  ],
  color: class_colors[:rogue],
  #flavour: '"A famous commander\'s signature thing."',
  type: 'Rogue Ability',
)

Card.output('rogue_abilities', rogue_abilities);

