load 'card.rb'

beginner_spells = {}

beginner_spells[:wispy_flame] = Card.new(
  title: "Wispy Flame",
  damage: 'd4',
  blood: 1,
  #reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: '(**even**) Engulf your hand in flames for short while. You need to maintain concentration.',
      symbol: [:clubs, :blood]
    ),
    Card::Action.new(
      seperator: true,
      content: '(**while concentrating**) Deal melee damage to a target with your flame engulfed hand. If the target is a small object set it on fire.',
      symbol: [:tap]
    ),
  ],
  color: 'firebrick',
  flavour: '"Portable Candle"',
  type: 'Blood Magic (Igneous)'
)


beginner_spells[:summon_flesh] = Card.new(
  title: "Summon Flesh",
  #damage: 3,
  blood: 1,
  #reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: '(**5 or less**) Heal a target within arms reach equal to the card played.',
      symbol: [:hearts, :blood]
    ),
    Card::Action.new(
      content: 'If this spell heals for more then half of the target\'s max health then they get flesh mass disease.',
      seperator: true,
    ),
  ],
  color: 'firebrick',
  flavour: '"Writhing flesh mass that assimilates"',
  type: 'Blood Magic (Eldritch)'
)

beginner_spells[:lighting_fork] = Card.new(
  title: "Lightning Fork",
  damage: '2d4',
  blood: 1,
  #reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: '(**even**) Deal 1d4 damage to one target and 1d4 to another. Both targets need to be within 10 meters if you',
      symbol: [:clubs, :blood]
    ),
  ],
  color: 'firebrick',
  flavour: '"Double the static, double the fun!"',
  type: 'Blood Magic (Storm)'
)

beginner_spells[:summon_alchemicals] = Card.new(
  title: "Summon Alchemicals",
  #damage: 3,
  blood: 2,
  #reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: '(**odd**) Summon a random amount of a random alchemical depending on various hidden factors.',
      symbol: [:diamonds, :blood]
    ),
  ],
  color: 'firebrick',
  flavour: '"You arent making a bomb, are you?"',
  type: 'Blood Magic (Eldritch)'
)

beginner_spells[:northern_wind] = Card.new( #TODO
  title: "Northern Wind",
  damage: '2d4',
  blood: 1,
  #reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: '(**odd**) Shoot a cold wind from your hands, freezing things in its path.',
      symbol: [:clubs, :blood]
    ),
  ],
  color: 'firebrick',
  flavour: '"Won\'t fail blowing out birthday candles"',
  type: 'Blood Magic (Storm)'
)


File.write('beginner_spells.html', Card.build(beginner_spells.values))
