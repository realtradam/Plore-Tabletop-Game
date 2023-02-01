require_relative 'card.rb'

rare_weapons = {}

rare_weapons[:glaive] = Card.new(
  title: "Glaive",
  color: 'rebeccapurple',
  reposte: 'Prc',
  damage: '4',
  actions: [
    Card::Action.new(
      content: '🎲 **d6 · Str** to Slash.',
      symbol: :tap,
    ),
    Card::Action.new(
      content: '**Reach**, **Heavy**',
      symbol: :invisible,
    ),
  ],
  flavour: '"Getting up close and personal while staying far away"',
  type: 'Polearm Weapon'
)

rare_weapons[:twinblade] = Card.new(
  title: "Twinblade",
  damage: 3,
  reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: '🎲 **d4 + Prc** to Slash.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: '🎲 **d6 + Prc** to Slash.',
      symbol: :tap,
    ),
    Card::Action.new(
      content: '**Heavy**',
    )
    #Card::Action.new(
    #  seperator: true,
    #  content: '(odd) **Swift Attack**: Refresh this card.',
    #  symbol: :spades
    #),
  ],
  color: 'rebeccapurple',
  flavour: '"Says \'Made by the Ninja Custodial Group\' on the handle"',
  type: 'Staff Weapon',
)

rare_weapons[:forked_sword] = Card.new(
  title: "Forked Sword",
  damage: 3,
  reposte: 'Str',
  #roll: '1d6',
  actions: [
    Card::Action.new(
      content: '🎲 **d6 + Str** to Pierce.',
      symbol: :tap,
    ),
    Card::Action.new(
      content: 'You can use the \'Cast a spell\' ability as a part of this action.',
      symbol: :invisible,
    ),
    Card::Action.new(
      seperator: true,
      content: 'Cast a **Blood Magic Spell**',
      symbol: :tap
    ),
  ],
  color: 'rebeccapurple',
  flavour: '"Weapon used in the war against the gods. Vintage!"',
  type: 'Forked Sword Weapon',
)

rare_weapons[:tower_shield] = Card.new(
  title: "Tower Shield",
  #damage: 4,
  #reposte: 'Str',
  actions: [
    Card::Action.new(
      content: 'When **targeted with a weapon:** your attacker recieves **2 disadvantage** on their action.',
      symbol: [:tap, :reactive],
    ),
    Card::Action.new(
      content: '**Heavy**.',
      symbol: :invisible,
    ),
    Card::Action.new(
      seperator: true,
      content: 'You can act as cover for another character.',
      #symbol: :invisible
    ),
    Card::Action.new(
      content: '**Heavy**.',
    ),
  ],
  flavour: '"Looks great with a flannel shirt."',
  color: 'rebeccapurple',
  type: 'Shield Weapon',
)

rare_weapons[:casters_glove] = Card.new(
  title: "Caster's Glove",
  roll: '1d8',
  actions: [
    Card::Action.new(
      content: '**Casting Focus**',
    ),
  ],
  color: 'DarkBlue',
  flavour: '"Modern  casting tool that works by directly drawing your blood"',
  type: 'Magic Casting Tool',
)

Card.output('rare_weapons', rare_weapons);
