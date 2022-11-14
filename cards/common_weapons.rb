load 'card.rb'

common_weapons = {}

common_weapons[:thrusting_sword] = Card.new(
  title: "Thrusting Sword",
  color: 'rebeccapurple',
  reposte: 'Prc',
  damage: '3',
  actions: [
    Card::Action.new(
      content: '🎲 **d8 + Prc** to hit.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: '**Opportune Strike**: When targeting an enemy with this weapon, mark them until the end of their turn. While marked if they attack somone other then you then you can perform a reposte on them.',
    )
  ],
  flavour: '"World Famous Iron Toothpick"',
  type: 'Thrusting Sword Weapon'
)


common_weapons[:polearm] = Card.new(
  title: "Polearm",
  color: 'rebeccapurple',
  reposte: 'Str',
  damage: '3',
  actions: [
    Card::Action.new(
      content: '🎲 **d6 + Str** to hit.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: '**Reach**: When making an attack, you ignore repostes from your target unless they also have Reach.',
      # TODO: this is the same as the bow making it superiour
      #symbol: :spades,
    ),
  ],
  flavour: '"Getting up close and personal while staying far away"',
  type: 'Polearm Weapon'
)

common_weapons[:dagger] = Card.new(
  title: "Dagger",
  color: 'rebeccapurple',
  reposte: 'Prc',
  damage: '2',
  actions: [
    Card::Action.new(
      content: '🎲 **d6 + Prc** to hit.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: '(even) **Swift Attack**: Refresh this card.',
      symbol: :spades
    ),
  ],
  flavour: '"A quick and convinient way to turn a spleen into a sheath"',
  type: 'Dagger Weapon'
)

common_weapons[:bow] = Card.new(
  title: "Bow",
  color: 'rebeccapurple',
  damage: '3',
  reposte: 1,
  actions: [
    Card::Action.new(
      content: '🎲 **d4 + (2·Prc)** to hit.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: '**Ranged**: When making an attack, you ignore repostes from your target. You can\'t deal a reposte either.',
    )
  ],
  flavour: '"One stringed instrument that got repurposed as a weapon."',
  type: 'Bow Weapon'
)

common_weapons[:crossbow] = Card.new(
  title: "Crossbow",
  color: 'rebeccapurple',
  damage: '4',
  reposte: 1,
  actions: [
    Card::Action.new(
      content: '(must be loaded) 🎲 **d6 + Prc** to hit.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: '**Reload**: Load this weapon.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: '**Ranged**: When making an attack, you ignore repostes from your target. You can\'t deal a reposte either.',
    )
  ],
  flavour: '"No one will cross you with this weapon"',
  type: 'Crossbow Weapon'
)

common_weapons[:hammer] = Card.new(
  title: "Hammer",
  reposte: 'Str',
  damage: 3,
  actions: [
    Card::Action.new(
      content: '🎲 **d6 + Str** to hit.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: '**Power Swing**: 🎲 **d4 + Str** to hit. Deal **Str + 2** damage.',
      symbol: :tap
    ),
  ],
  flavour: '"If you can pick it up, then you are worthy enough to use it."',
  color: 'rebeccapurple',
  type: 'Hammer Weapon'
)

common_weapons[:straight_sword] = Card.new(
  title: "Straight Sword",
  damage: 3,
  reposte: 'Str',
  actions: [
    Card::Action.new(
      content: '🎲 **d6 + Str** to hit.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: '(Two Handed) 🎲 **d6 + Str** to hit. Deal **Str** damage.',
      symbol: :tap,
    )
  ],
  flavour: '"El Classico"',
  color: 'rebeccapurple',
  type: 'Straight Sword Weapon'
)

common_weapons[:axe] = Card.new(
  title: "Axe",
  damage: 3,
  reposte: 'Str',
  actions: [
    Card::Action.new(
      content: '🎲 **d8 + Str** to hit.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: '**Throw**: 🎲 **d6 + Str** to hit. This attack is **Ranged** and thus you ignore repostes from your target. You lose this weapon by using this attack.',
      symbol: :tap
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
      content: '🎲 **d6 + Str** to hit.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: '(Two Handed) 🎲 **d8 + Str** to hit.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: '(odd) **Swift Attack**: Refresh this card.',
      symbol: :spades
    ),
  ],
  color: 'rebeccapurple',
  flavour: '"Says \'Made by the Ninja Custodial Group\' on the handle"',
  type: 'Staff Weapon',
)

common_weapons[:curved_sword] = Card.new(
  title: "Curved Sword",
  damage: 3,
  reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: '🎲 **d6 + Prc** to hit.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: '(odd, recieving a reposte) **Close Quarters**: Deal damage equal to your reposte.',
      symbol: :spades
    ),
  ],
  color: 'rebeccapurple',
  flavour: '"Arrrgh"',
  type: 'Curved Sword Weapon',
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

common_weapons[:test_weapon] = Card.new(
  title: "Test Weapon",
  damage: 3,
  reposte: 'Prc',
  actions: [
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
  color: 'rebeccapurple',
  flavour: '"Arrr"',
  type: 'Curved Sword Weapon',
)

File.write('common_weapons.html', Card.build(common_weapons.values))
