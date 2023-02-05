require_relative 'card.rb'

monk_abilities = {}

class_colors = {
  rogue: 'Maroon',
  ranger: 'ForestGreen', 
  astrologist: 'DodgerBlue',
  monk: 'OrangeRed',
  paladin: 'GoldenRod'
}

monk_abilities[:pressure_point] = Card.new(
  title: "Pressure Point",
  actions: [
    Card::Action.new(
      symbol: [:diamonds, :reactive],
      content: 'After a successful attack: deactivate one of the target\'s abilities of your choosing.',
    ),
  ],
  color: class_colors[:monk],
  #flavour: '"A famous commander\'s signature thing."',
  type: 'Monk Ability',
)

monk_abilities[:flurry_of_strikes] = Card.new(
  title: "Flurry of Strikes",
  actions: [
    Card::Action.new(
      symbol: [:even, :tap],
      content: 'Make an attack with your weapon. If that attack is successful: recharge this.',
    ),
  ],
  color: class_colors[:monk],
  #flavour: '"A famous commander\'s signature thing."',
  type: 'Monk Ability',
)

monk_abilities[:quick_footwork] = Card.new(
  title: "Quick Footwork",
  actions: [
    Card::Action.new(
      symbol: [:joker, :reactive],
      content: 'Ignore the incoming damage of a parry.',
    ),
  ],
  color: class_colors[:monk],
  #flavour: '"A famous commander\'s signature thing."',
  type: 'Monk Ability',
)

monk_abilities[:inner_peace] = Card.new(
  title: "Inner Peace",
  actions: [
    Card::Action.new(
      symbol: [:tap, :reactive],
      content: 'If you havent recieved damage during your turn yet, reroll a dice of your choice.',
    ),
  ],
  color: class_colors[:monk],
  #flavour: '"A famous commander\'s signature thing."',
  type: 'Monk Ability',
)

Card.output('monk_abilities', monk_abilities);

