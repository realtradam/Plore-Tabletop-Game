load 'card.rb'

cards = []

card = Card.new
card.title = "Thrusting Sword"
card.color = 'rebeccapurple'
#card.attrib_top_right = '1'
#card.attrib_top_right_icon = '🩸'
#card.attrib_top_right = '2'
#card.attrib_top_right_icon = '🛡️'
card.attrib_bottom_right = 'Pre'
card.attrib_bottom_right_icon = '🎲'
card.attrib_bottom_left = '5'
card.attrib_bottom_left_icon = '⚔️'
card.actions.push Card::Action.new(
  content: '🎲 **d6 + Prescision** to hit.',
  symbol: :tap,
)
card.actions.push Card::Action.new(
  seperator: true,
  content: '**Opportune Strike**: When targeting an enemy with this weapon, mark them until the end of their turn. While marked if they attack somone other then you then you can perform a reposte on them.',
  #symbol: :spades,
)
card.flavour = '"World Famous Iron Toothpick"'
card.type = 'Weapon'
cards.push card


card = Card.new
card.title = "Spear"
card.color = 'rebeccapurple'
#card.attrib_top_right = '1'
#card.attrib_top_right_icon = '🩸'
#card.attrib_top_right = '2'
#card.attrib_top_right_icon = '🛡️'
card.attrib_bottom_right = 'Str'
card.attrib_bottom_right_icon = '🎲'
card.attrib_bottom_left = '4'
card.attrib_bottom_left_icon = '⚔️'
card.actions.push Card::Action.new(
  content: '🎲 **d6 + (Prescision or Strength)** to hit.',
  symbol: :tap,
)
card.actions.push Card::Action.new(
  seperator: true,
  content: '**Reach**: When making an attack, you ignore repostes from your target.',
  # TODO: this is the same as the bow making it superiour
  #symbol: :spades,
)
card.flavour = '"Getting up close and personal while staying far away"'
card.type = 'Weapon'
cards.push card


card = Card.new
card.title = "Dagger"
card.color = 'rebeccapurple'
#card.attrib_top_right = '1'
#card.attrib_top_right_icon = '🩸'
#card.attrib_top_right = '2'
#card.attrib_top_right_icon = '🛡️'
card.attrib_bottom_right = 'Pre'
card.attrib_bottom_right_icon = '🎲'
card.attrib_bottom_left = '3'
card.attrib_bottom_left_icon = '⚔️'
card.actions.push Card::Action.new(
  content: '🎲 **d6 + (Prescision or Strength)** to hit.',
  symbol: :tap,
)
card.actions.push Card::Action.new(
  seperator: true,
  content: '(even) **Swift Attack**: Refresh this card.',
  symbol: :spades
  #symbol: :spades,
)
card.flavour = '"A quick and convinient way to turn a spleen into a sheath"'
card.type = 'Weapon'
cards.push card

card = Card.new
card.title = "Bow"
card.color = 'rebeccapurple'
#card.attrib_top_right = '1'
#card.attrib_top_right_icon = '🩸'
#card.attrib_top_right = '2'
#card.attrib_top_right_icon = '🛡️'
#card.attrib_bottom_right = 'Pre'
#card.attrib_bottom_right_icon = '🎲'
card.attrib_bottom_left = '5'
card.attrib_bottom_left_icon = '⚔️'
card.actions.push Card::Action.new(
  content: '🎲 **d8 + Prescision** to hit.',
  symbol: :tap,
)
card.actions.push Card::Action.new(
  seperator: true,
  content: '**Ranged**: When making an attack, you ignore repostes from your target.',
)
card.flavour = '"One stringed instrument that got repurposed as a weapon."'
card.type = 'Weapon'
cards.push card

card = Card.new
card.title = "Crossbow"
card.color = 'rebeccapurple'
#card.attrib_top_right = '1'
#card.attrib_top_right_icon = '🩸'
#card.attrib_top_right = '2'
#card.attrib_top_right_icon = '🛡️'
#card.attrib_bottom_right = 'Pre'
#card.attrib_bottom_right_icon = '🎲'
card.attrib_bottom_left = '7'
card.attrib_bottom_left_icon = '⚔️'
card.actions.push Card::Action.new(
  content: '(must be loaded) 🎲 **d6 + Prescision** to hit.',
  symbol: :tap,
)
card.actions.push Card::Action.new(
  seperator: true,
  content: '**Reload**: Load this weapon.',
  symbol: :tap,
)
card.actions.push Card::Action.new(
  seperator: true,
  content: '**Ranged**: When making an attack, you ignore repostes from your target.',
)
card.flavour = '"No one will cross you with this weapon"'
card.type = 'Weapon'
cards.push card

card = Card.new
card.title = "Warhammer"
card.color = 'rebeccapurple'
#card.attrib_top_right = '1'
#card.attrib_top_right_icon = '🩸'
#card.attrib_top_right = '2'
#card.attrib_top_right_icon = '🛡️'
#card.attrib_bottom_right = 'Pre'
#card.attrib_bottom_right_icon = '🎲'
#card.attrib_bottom_left = '3'
#card.attrib_bottom_left_icon = '⚔️'
#card.actions.push Card::Action.new(
#  content: '(must be loaded) 🎲 **d8 + Prescision** to hit. Deals ⚔️ **7 damage**.',
#  symbol: :tap,
#)
#card.actions.push Card::Action.new(
#  seperator: true,
#  content: '**Reload**: Load this weapon.',
#  symbol: :tap,
#)
#card.actions.push Card::Action.new(
#  seperator: true,
#  content: '**Ranged**: When making an attack, you ignore repostes from your target.',
#)
card.type = 'Weapon'
cards.push card

card = Card.new
card.title = "Straight Sword"
card.color = 'rebeccapurple'
#card.attrib_top_right = '1'
#card.attrib_top_right_icon = '🩸'
#card.attrib_top_right = '2'
#card.attrib_top_right_icon = '🛡️'
#card.attrib_bottom_right = 'Pre'
#card.attrib_bottom_right_icon = '🎲'
#card.attrib_bottom_left = '3'
#card.attrib_bottom_left_icon = '⚔️'
#card.actions.push Card::Action.new(
#  content: '(must be loaded) 🎲 **d8 + Prescision** to hit. Deals ⚔️ **7 damage**.',
#  symbol: :tap,
#)
#card.actions.push Card::Action.new(
#  seperator: true,
#  content: '**Reload**: Load this weapon.',
#  symbol: :tap,
#)
#card.actions.push Card::Action.new(
#  seperator: true,
#  content: '**Ranged**: When making an attack, you ignore repostes from your target.',
#)
card.type = 'Weapon'
cards.push card

card = Card.new
card.title = "Axe"
card.color = 'rebeccapurple'
#card.attrib_top_right = '1'
#card.attrib_top_right_icon = '🩸'
#card.attrib_top_right = '2'
#card.attrib_top_right_icon = '🛡️'
#card.attrib_bottom_right = 'Pre'
#card.attrib_bottom_right_icon = '🎲'
#card.attrib_bottom_left = '3'
#card.attrib_bottom_left_icon = '⚔️'
#card.actions.push Card::Action.new(
#  content: '(must be loaded) 🎲 **d8 + Prescision** to hit. Deals ⚔️ **7 damage**.',
#  symbol: :tap,
#)
#card.actions.push Card::Action.new(
#  seperator: true,
#  content: '**Reload**: Load this weapon.',
#  symbol: :tap,
#)
#card.actions.push Card::Action.new(
#  seperator: true,
#  content: '**Ranged**: When making an attack, you ignore repostes from your target.',
#)
card.type = 'Weapon'
cards.push card

card = Card.new
card.title = "Staff"
card.color = 'rebeccapurple'
#card.attrib_top_right = '1'
#card.attrib_top_right_icon = '🩸'
#card.attrib_top_right = '2'
#card.attrib_top_right_icon = '🛡️'
#card.attrib_bottom_right = 'Pre'
#card.attrib_bottom_right_icon = '🎲'
#card.attrib_bottom_left = '3'
#card.attrib_bottom_left_icon = '⚔️'
#card.actions.push Card::Action.new(
#  content: '(must be loaded) 🎲 **d8 + Prescision** to hit. Deals ⚔️ **7 damage**.',
#  symbol: :tap,
#)
#card.actions.push Card::Action.new(
#  seperator: true,
#  content: '**Reload**: Load this weapon.',
#  symbol: :tap,
#)
#card.actions.push Card::Action.new(
#  seperator: true,
#  content: '**Ranged**: When making an attack, you ignore repostes from your target.',
#)
card.type = 'Weapon'
cards.push card

card = Card.new
card.title = "Curved Sword"
card.color = 'rebeccapurple'
#card.attrib_top_right = '1'
#card.attrib_top_right_icon = '🩸'
#card.attrib_top_right = '2'
#card.attrib_top_right_icon = '🛡️'
#card.attrib_bottom_right = 'Pre'
#card.attrib_bottom_right_icon = '🎲'
#card.attrib_bottom_left = '3'
#card.attrib_bottom_left_icon = '⚔️'
#card.actions.push Card::Action.new(
#  content: '(must be loaded) 🎲 **d8 + Prescision** to hit. Deals ⚔️ **7 damage**.',
#  symbol: :tap,
#)
#card.actions.push Card::Action.new(
#  seperator: true,
#  content: '**Reload**: Load this weapon.',
#  symbol: :tap,
#)
#card.actions.push Card::Action.new(
#  seperator: true,
#  content: '**Ranged**: When making an attack, you ignore repostes from your target.',
#)
card.type = 'Weapon'
cards.push card

card = Card.new
card.title = "Caestus"
card.color = 'DarkBlue'
#card.attrib_top_right = '1'
#card.attrib_top_right_icon = '🩸'
#card.attrib_top_right = '2'
#card.attrib_top_right_icon = '🛡️'
#card.attrib_bottom_right = 'Pre'
#card.attrib_bottom_right_icon = '🎲'
#card.attrib_bottom_left = '3'
#card.attrib_bottom_left_icon = '⚔️'
#card.actions.push Card::Action.new(
#  content: '(must be loaded) 🎲 **d8 + Prescision** to hit. Deals ⚔️ **7 damage**.',
#  symbol: :tap,
#)
card.actions.push Card::Action.new(
  #seperator: true,
  content: 'While equipped: Unarmed Strikes deal **Strength** additional damage.',
  #symbol: :tap,
)
#card.actions.push Card::Action.new(
#  seperator: true,
#  content: '**Ranged**: When making an attack, you ignore repostes from your target.',
#)
card.flavour = '"Weapon of choice for a fit bronze statue"'
card.type = 'Equipment'
cards.push card

File.write('card.html', Card.build(cards))
