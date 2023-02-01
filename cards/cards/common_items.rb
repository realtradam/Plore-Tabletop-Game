require_relative 'card.rb'

common_items = {}

common_items[:test] = Card.new(
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

common_items[:sack] = Card.new(
  title: "Sack",
  color: 'saddlebrown',
  actions: [
    Card::Action.new(
      content: '**Item slot**: 12 spaces.',
    ),
    Card::Action.new(
      seperator: true,
      content: 'Draw up to 2 cards from this inventory and place up to 2 items to the front or back of this inventory.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: 'Equips on your back.',
    ),
  ],
  #flavour: '"World Famous Iron Toothpick"',
  type: 'Leather Item Container'
)

common_items[:satchel] = Card.new(
  title: "Satchel",
  color: 'saddlebrown',
  actions: [
    Card::Action.new(
      content: '**Item slot**: 6 spaces.',
    ),
    Card::Action.new(
      seperator: true,
      content: 'Draw up to 3 cards from this inventory and place up to 3 items to the front or back of this inventory.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: 'Equips on your back.',
    ),
  ],
  #flavour: '"World Famous Iron Toothpick"',
  type: 'Leather Item Container'
)

common_items[:rucksack] = Card.new(
  title: "Rucksack",
  color: 'saddlebrown',
  actions: [
    Card::Action.new(
      content: '**Item slot**: 12 spaces.',
    ),
    Card::Action.new(
      content: '**Item slot**: 6 spaces.',
    ),
    Card::Action.new(
      seperator: true,
      content: 'Draw up to 2 cards from this inventory and place up to 2 items to the front or back of this inventory.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: 'Equips on your back.',
    ),
  ],
  #flavour: '"World Famous Iron Toothpick"',
  type: 'Leather Item Container'
)

common_items[:sheath] = Card.new(
  title: "Sheath",
  color: 'saddlebrown',
  actions: [
    Card::Action.new(
      content: '**Item slot**: 1 weapon.',
    ),
    Card::Action.new(
      seperator: true,
      content: 'Draw up to 1 cards from this inventory and place up to 1 weapon to this inventory.',
      symbol: :tap,
    ),
    Card::Action.new(
      seperator: true,
      content: 'Equips on your back or hip.',
    ),
  ],
  #flavour: '"World Famous Iron Toothpick"',
  type: 'Leather Item Container'
)

common_items[:hand_bomb] = Card.new(
  title: "Hand Bomb",
  color: 'grey',
  actions: [
    Card::Action.new(
      content: 'Deal **3 damage**. Consumes this item.',
      symbol: :tap,
    ),
  ],
  #flavour: '"World Famous Iron Toothpick"',
  type: 'Consumable Weapon'
)

Card.output('common_items', common_items);
