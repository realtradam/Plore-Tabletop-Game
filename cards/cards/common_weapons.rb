require_relative 'card.rb'

common_weapons = {}

common_weapons[:test] = Card.new(
  title: "Test",
  color: 'rebeccapurple',
  reposte: 'Prc',
  damage: '3',
  actions: [
    Card::Action.new(
      content: '🎲 **d8 · Prc** to Bludgeon.',
      symbol: [
        :tap,
        :odd,
        :even,
        :greater,
        :lesser,
        :blood,
        :reactive,
        :face,
      ],
    ),
    Card::Action.new(
      content: '🎲 **d6 + Prc** to hit.',
      symbol: :spades,
    ),
    Card::Action.new(
      seperator: true,
      content: '🎲 **d6 + Prc** to hit.',
      symbol: :clubs,
    ),
    Card::Action.new(
      seperator: true,
      content: '🎲 **d6 + Prc** to hit.',
      symbol: :diamonds,
    ),
    Card::Action.new(
      seperator: true,
      content: '🎲 **d6 + Prc** to hit.',
      symbol: :joker,
    ),
    Card::Action.new(
      seperator: true,
      content: '🎲 **d6 + Prc** to hit.',
      symbol: [:tap, :hearts]
    ),
  ],
  flavour: '"World Famous Iron Toothpick"',
  type: 'Thrusting Sword Weapon'
)

=begin
common_weapons[:rapier] = Card.new(
  title: "Rapier",
  color: 'rebeccapurple',
  reposte: 'Prc',
  damage: '3',
  actions: [
    Card::Action.new(
      content: '🎲 **d8 · Prc** to Pierce.',
      symbol: :tap,
    ),
    #Card::Action.new(
    #  seperator: true,
    #  content: '**Opportune Strike**: When targeting an enemy with this weapon, mark them until the end of their turn. While marked if they attack somone other then you then you can perform a reposte on them.',
    #)
  ],
  flavour: '"World Famous Iron Toothpick"',
  type: 'Thrusting Sword Weapon'
)
=end

common_weapons[:spear] = Card.new(
  title: "Spear",
  color: 'rebeccapurple',
  reposte: 'Prc',
  damage: '3',
  actions: [
    Card::Action.new(
      content: '🎲 **d6 · Prc** to Pierce.',
      symbol: :tap,
    ),
    Card::Action.new(
      content: '**Reach**, **Throwable**',
      symbol: :invisible,
    ),
  ],
  flavour: '"5x more throwable then previous editions"',
  type: 'Polearm Weapon'
)

common_weapons[:dagger] = Card.new(
  title: "Dagger",
  color: 'rebeccapurple',
  reposte: 'Prc',
  damage: '2',
  actions: [
    Card::Action.new(
      content: '🎲 **d4 · Prc** to Pierce.',
      symbol: :tap,
    ),
    Card::Action.new(
      content: '**Light**, **Throwable**',
      symbol: :invisible,
      #symbol: :spades
    ),
    #Card::Action.new(
    #  seperator: true,
    #  content: '(even) **Swift Attack**: Refresh this card.',
    #  symbol: :spades
    #),
  ],
  flavour: '"A quick and convinient way to turn a spleen into a sheath"',
  type: 'Dagger Weapon'
)

common_weapons[:longbow] = Card.new(
  title: "Longbow",
  color: 'rebeccapurple',
  damage: '3',
  #reposte: 1,
  actions: [
    Card::Action.new(
      content: '🎲 **d6 · Prc** to Pierce.',
      symbol: :tap,
    ),
    Card::Action.new(
      content: '**Ranged**',
      symbol: :invisible,
    )
    #Card::Action.new(
    #  seperator: true,
    #  content: '**Ranged**: When making an attack, you ignore repostes from your target. You can\'t deal a reposte either.',
    #)
  ],
  flavour: '"One stringed instrument that got repurposed as a weapon."',
  type: 'Bow Weapon'
)

common_weapons[:crossbow] = Card.new(
  title: "Crossbow",
  color: 'rebeccapurple',
  damage: '3',
  #reposte: 1,
  actions: [
    Card::Action.new(
      content: 'Remove a counter.',
      symbol: :tap,
    ),
    Card::Action.new(
      content: '🎲 **d8 · Prc** to Pierce.',
      symbol: :invisible,
    ),
    Card::Action.new(
      content: '**Ranged**',
      symbol: :invisible,
    ),
    Card::Action.new(
      seperator: true,
      content: '**Reload**: Load this weapon. Add a counter to this card.',
      symbol: :tap,
    ),
  ],
  flavour: '"No one will cross you with this weapon"',
  type: 'Crossbow Weapon'
)

common_weapons[:warhammer] = Card.new(
  title: "Warhammer",
  reposte: 'Str',
  damage: 3,
  actions: [
    Card::Action.new(
      content: '🎲 **d8 · (Str)** to Bludgeon.',
      symbol: :tap,
    ),
  ],
  flavour: '"Made of over 39,000 minature hammers"',
  color: 'rebeccapurple',
  type: 'Hammer Weapon'
)

common_weapons[:sickle] = Card.new(
  title: "Sickle",
  reposte: 'Prc',
  damage: 1,
  actions: [
    Card::Action.new(
      content: '🎲 **d4 · (Prc)** to Bludgeon.',
      symbol: :tap,
    ),
    Card::Action.new(
      content: '**Light**, **Cleave**',
      symbol: :invisible,
    ),
  ],
  flavour: '"Made of over 39,000 minature hammers"',
  color: 'rebeccapurple',
  type: 'Farming Weapon'
)

common_weapons[:scythe] = Card.new(
  title: "Scythe",
  reposte: 'Prc',
  damage: 2,
  actions: [
    Card::Action.new(
      content: '🎲 **d6 · (Prc)** to Bludgeon.',
      symbol: :tap,
    ),
    Card::Action.new(
      content: '**Heavy**, **Cleave**',
      symbol: :invisible,
    ),
  ],
  flavour: '"Made of over 39,000 minature hammers"',
  color: 'rebeccapurple',
  type: 'Farming Weapon'
)

common_weapons[:short_sword] = Card.new(
  title: "Short Sword",
  damage: 3,
  reposte: 'Str',
  actions: [
    Card::Action.new(
      content: '🎲 **d6 · Str** to hit.',
      symbol: :tap,
    ),
    Card::Action.new(
      content: '**Light**',
      symbol: :invisible,
    ),
  ],
  flavour: '"El Classico"',
  color: 'rebeccapurple',
  type: 'Straight Sword Weapon'
)

common_weapons[:straight_sword] = Card.new(
  title: "Long Sword",
  damage: 3,
  reposte: 'Str',
  actions: [
    Card::Action.new(
      content: '🎲 **d8 · Str** to hit.',
      symbol: :tap,
    ),
    #Card::Action.new(
    #  seperator: true,
    #  content: '(Two Handed) 🎲 **d6 + Str** to hit. Deal **Str** damage.',
    #  symbol: :tap,
    #)
  ],
  flavour: '"El Classico"',
  color: 'rebeccapurple',
  type: 'Straight Sword Weapon'
)

common_weapons[:axe] = Card.new(
  title: "Axe",
  damage: 4,
  reposte: 'Str',
  actions: [
    Card::Action.new(
      content: '🎲 **d6 · Str** to Slash.',
      symbol: :tap,
    ),
  ],
  flavour: '"Looks great with a flannel shirt."',
  color: 'rebeccapurple',
  type: 'Axe Weapon',
)

common_weapons[:staff] = Card.new(
  title: "Staff",
  damage: 2,
  reposte: 'Str',
  actions: [
    Card::Action.new(
      content: '🎲 **d6 + Str** to Bludgeon.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: '🎲 **d8 + Str** to Bludgeon.',
      symbol: :tap,
    ),
    Card::Action.new(
      content: '**Heavy**',
    )
  ],
  color: 'rebeccapurple',
  flavour: '"Says \'Made by the Ninja Custodial Group\' on the handle"',
  type: 'Staff Weapon',
)

common_weapons[:kite_shield] = Card.new(
  title: "Kite Shield",
  #damage: 4,
  #reposte: 'Str',
  actions: [
    Card::Action.new(
      content: 'When **targeted with a weapon:** your attacker recieves **2 disadvantage** on their action.',
      symbol: [:tap, :reactive],
    ),
  ],
  flavour: '"Looks great with a flannel shirt."',
  color: 'rebeccapurple',
  type: 'Shield Weapon',
)

common_weapons[:buckler_shield] = Card.new(
  title: "Buckler Shield",
  #damage: 4,
  #reposte: 'Str',
  actions: [
    Card::Action.new(
      content: 'When **targeted with a weapon:** your attacker recieves **1 disadvantage** on their action. If your reposte triggers then deal double damage with it.',
      symbol: [:tap, :reactive],
    ),
  ],
  flavour: '"Looks great with a flannel shirt."',
  color: 'rebeccapurple',
  type: 'Shield Weapon',
)

common_weapons[:caestus] = Card.new(
  title: "Caestus",
  color: 'DarkBlue',
  actions: [
    Card::Action.new(
      content: 'While equipped: Unarmed Strikes deal **Str** additional damage.',
    )
  ],
  flavour: '"Weapon of choice for a fit bronze statue"',
  type: 'Weapon Equipment'
)

common_weapons[:tuning_fork] = Card.new(
  title: "Tuning Fork",
  roll: '1d4',
  actions: [
    Card::Action.new(
      content: '**Casting Focus**',
    ),
  ],
  color: 'DarkBlue',
  flavour: '"Resonates with various magical frequencies to help with casting blood magic"',
  type: 'Magic Casting Tool',
)

File.write('common_weapons.html', Card.build(common_weapons.values))

Card.output('common_weapons', common_weapons);
