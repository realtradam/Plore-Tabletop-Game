load 'card.rb'

cards = []

card = Card.new
card.title = "Wispy Flame"
card.color = 'firebrick'

card.attrib_top_right = '1'
card.attrib_top_right_icon = '🩸'

#card.attrib_top_right = '2'
#card.attrib_top_right_icon = '🛡️'

#card.attrib_bottom_right = '1'
#card.attrib_bottom_right_icon = '🎲'

#card.attrib_bottom_left = '1'
#card.attrib_bottom_left_icon = '⚔️'

card.actions.push Card::Action.new(
  content: '(**even**) Deal melee 🎲 **d4 damage**. If it is a small object set it on fire.',
  symbol: :spades,
)
card.flavour = '"Portable Candle"'
card.type = 'Blood Magic'

cards.push card

card = Card.new
card.title = "Summon Flesh"
card.color = 'firebrick'

card.attrib_top_right = '1'
card.attrib_top_right_icon = '🩸'

#card.attrib_top_right = '2'
#card.attrib_top_right_icon = '🛡️'

#card.attrib_bottom_right = '2'
#card.attrib_bottom_right_icon = '🎲'

#card.attrib_bottom_left = '1'
#card.attrib_bottom_left_icon = '⚔️'

card.actions.push Card::Action.new(
  content: '(**5 or less**) Heal a target within arms reach equal to the card played.',
  symbol: :hearts,
)
card.actions.push Card::Action.new(
  content: 'If this spell heals for more then half of the target\'s max health then they get flesh mass disease.',
  seperator: true,
)
card.flavour = '"Writhing flesh mass that assimilates"'
card.type = 'Blood Magic'

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
