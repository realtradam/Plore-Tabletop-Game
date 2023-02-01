require_relative 'card.rb'

cards = []

card = Card.new
card.title = "Unarmed Strike"
card.color = 'goldenrod'

#card.attrib_top_left = '14'
#card.attrib_top_left_icon = '🩸'

#card.attrib_top_right = '2'
#card.attrib_top_right_icon = '🛡️'

card.attrib_bottom_right = '1'
card.attrib_bottom_right_icon = '🎲'

card.attrib_bottom_left = '1'
card.attrib_bottom_left_icon = '⚔️'

card.actions.push Card::Action.new(
  content: 'Attack with a 🎲 **d4** roll. On success deal ⚔️ **1 damage**.',
  symbol: :tap,
)
card.flavour = '"Savage"'
card.type = 'Innate Weapon'

cards.push card

card = Card.new
card.title = "Well Worn Knife"
card.color = 'rebeccapurple'

#card.attrib_top_left = '14'
#card.attrib_top_left_icon = '🩸'

#card.attrib_top_right = '2'
#card.attrib_top_right_icon = '🛡️'

card.attrib_bottom_right = '2'
card.attrib_bottom_right_icon = '🎲'

card.attrib_bottom_left = '1'
card.attrib_bottom_left_icon = '⚔️'

card.actions.push Card::Action.new(
  content: 'Attack with a 🎲 **d6** roll. On success deal ⚔️ **Prescision+1 or Strength+1 damage**.',
  symbol: :tap,
)
#card.actions.push Card::Action.new(
#  content: 'Play an **even** ♠️ to un-tap',
#  seperator: true,
#)
card.flavour = '"Only *slightly* better then a butter knife."'
card.type = 'Weapon'

cards.push card

card = Card.new
card.title = "Slingshot"
card.color = 'rebeccapurple'

#card.attrib_top_left = '14'
#card.attrib_top_left_icon = '🩸'

#card.attrib_top_right = '2'
#card.attrib_top_right_icon = '🛡️'

#card.attrib_bottom_right = '2'
#card.attrib_bottom_right_icon = '🎲'

#card.attrib_bottom_left = '1'
#card.attrib_bottom_left_icon = '⚔️'

card.actions.push Card::Action.new(
  content: 'Attack with a 🎲 **d6** roll. On success deal ⚔️ **Prescision damage**.',
  symbol: :tap,
)
card.actions.push Card::Action.new(
  content: 'Ranged: This weapon avoids melee reposte attacks.',
  seperator: true,
)
card.flavour = '"Only a troublemaker would use this."'
card.type = 'Weapon'

cards.push card


File.write('card.html', Card.build(cards))

Card.output('alchemical_recipes', alchemical_recipes)
