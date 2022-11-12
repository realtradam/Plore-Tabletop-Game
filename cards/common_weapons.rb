load 'card.rb'

cards = []

cards.push Card.new(
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


cards.push Card.new(
  title: "Spear",
  color: 'rebeccapurple',
  reposte: 'Str',
  damage: '2',
  actions: [
    Card::Action.new(
      content: '🎲 **d6 + Str** to hit.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: '**Reach**: When making an attack, you ignore repostes from your target.',
      # TODO: this is the same as the bow making it superiour
      #symbol: :spades,
    ),
  ],
  flavour: '"Getting up close and personal while staying far away"',
  type: 'Spear Weapon'
)


cards.push Card.new(
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

cards.push Card.new(
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

cards.push Card.new(
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

cards.push Card.new(
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

cards.push Card.new(
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

cards.push Card.new(
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

cards.push Card.new(
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

cards.push Card.new(
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

cards.push Card.new(
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

File.write('card.html', Card.build(cards))
