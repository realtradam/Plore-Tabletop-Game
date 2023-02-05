require_relative 'card.rb'

ranger_abilities = {}

class_colors = {
  rogue: 'Maroon',
  ranger: 'ForestGreen', 
  astrologist: 'DodgerBlue',
  monk: 'OrangeRed',
  paladin: 'GoldenRod'
}

ranger_abilities[:hunters_mark] = Card.new(
  title: "Hunter's Mark",
  actions: [
    Card::Action.new(
      symbol: [:lesser],
      content: 'Mark a target you can see. Weapon attacks agaisnt a marked target get an advantage for each mark. Marked targets remain revealed for the duration of the mark. Marks last 30 minutes.',
    ),
  ],
  color: class_colors[:ranger],
  #flavour: '"A famous commander\'s signature thing."',
  type: 'Ranger Ability',
)

ranger_abilities[:quick_shot] = Card.new(
  title: "Quick Shot",
  actions: [
    Card::Action.new(
      symbol: [:spades],
      content: 'Recharge a ranged weapon you have equipped.',
    ),
  ],
  color: class_colors[:ranger],
  #flavour: '"A famous commander\'s signature thing."',
  type: 'Ranger Ability',
)

ranger_abilities[:flexible_shooter] = Card.new(
  title: "Flexible Shooter",
  actions: [
    Card::Action.new(
      symbol: [:joker, :reactive],
      content: 'When you have a ranged weapon equipped that is unable to parry and given the opportunity to parry: deal damage with that weapon.',
    ),
  ],
  color: class_colors[:ranger], 
  #flavour: '"Missed me"',
  type: 'Ranger Ability',
)

ranger_abilities[:pack_rat] = Card.new(
  title: "Pack Rat",
  actions: [
    Card::Action.new(
      #symbol: [:joker, :reactive],
      content: 'Bags you have equipped can hold 2 additional slots. You can choose and divide these slots among the pockets of the bag as you see fit.',
    ),
  ],
  color: class_colors[:ranger], 
  #flavour: '"Missed me"',
  type: 'Ranger Ability',
)

Card.output('ranger_abilities', ranger_abilities);

