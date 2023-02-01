require_relative 'card.rb'

beginner_spells = {}

spell_color = 'firebrick'
modifier_color = "#b24747"

=begin

beginner_spells[:wispy_flame] = Card.new(
  title: "Wispy Flame",
  damage: 'd4',
  blood: 1,
  #reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: 'Engulf your hand in flames for one turn. You need to maintain concentration each turn.',
      symbol: [:joker, :blood]
    ),
    Card::Action.new(
      seperator: true,
      content: '(**while concentrating**) Deal melee damage to a target with your flame engulfed hand. If the target is a small object set it on fire.',
      symbol: [:tap]
    ),
  ],
  color: spell_color,
  flavour: '"Portable Candle"',
  type: 'Blood Magic(Igneous)'
)

beginner_spells[:concentrated_cast] = Card.new(
  title: "Concentrated Cast",
  actions: [
    Card::Action.new(
      content: 'Change the number of turns you need to check for concentration equal to the **card played** times your **Resolve**.',
      symbol: [:even]
    ),
  ],
  color: modifier_color,
  #flavour: '"Portable Candle"',
  type: 'Blood Magic(Modifier)'
)

beginner_spells[:powerful_cast] = Card.new(
  title: "Powerful Cast",
  actions: [
    Card::Action.new(
      content: 'Double the amount of dice rolled for this spell.',
      symbol: [:face]
    ),
  ],
  color: modifier_color,
  #flavour: '"Portable Candle"',
  type: 'Blood Magic(Modifier)'
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
  color: spell_color,
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
      content: 'Summon a random amount of a random alchemical depending on various hidden factors.',
      symbol: [:joker, :blood]
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
=end
beginner_spells[:planes_of_igneous] = Card.new( #TODO
  title: "Planes of Igneous",
  blood: 1,
  #reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: 'Attune to the planes of igneous.',
      symbol: [:blood]
    ),
  ],
  color: 'firebrick',
  flavour: '"Sea of flames and ashes."',
  type: 'Blood Spell Base'
)
# Ruby

beginner_spells[:planes_of_storm] = Card.new( #TODO
  title: "Planes of Storm",
  blood: 1,
  #reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: 'Attune to the planes of storm.',
      symbol: [:blood]
    ),
  ],
  color: 'firebrick',
  flavour: '"Ice cold winds and storms."',
  type: 'Blood Spell Base'
)
# Sapphire

beginner_spells[:planes_of_eldritch] = Card.new( #TODO
  title: "Planes of Eldritch",
  blood: 1,
  #reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: 'Attune to the planes of eldritch.',
      symbol: [:blood]
    ),
  ],
  color: 'firebrick',
  flavour: '"Alchemicals and fleshy masses."',
  type: 'Blood Spell Base'
)
# Ammolite

beginner_spells[:planes_of_void] = Card.new( #TODO
  title: "Planes of Void",
  blood: 1,
  #reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: 'Attune to the planes of void.',
      symbol: [:blood]
    ),
  ],
  color: 'firebrick',
  flavour: '"Control Gravity"',
  type: 'Blood Spell Base'
)
# Quartz

beginner_spells[:planes_of_soul] = Card.new( #TODO
  title: "Planes of Soul",
  blood: 1,
  #reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: 'Attune to the planes of soul.',
      symbol: [:blood]
    ),
  ],
  color: 'firebrick',
  flavour: '"Dreams and Memories?"',
  type: 'Blood Spell Base'
)
# Ilvaite

beginner_spells[:touch] = Card.new( #TODO
  title: "Touch of Magic",
  blood: 1,
  #reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: 'Summon magic around your hand.',
      symbol: [:blood, :odd]
    ),
  ],
  color: 'firebrick',
  #flavour: '"Alchemicals and fleshy masses."',
  type: 'Blood Spell Modified'
)

beginner_spells[:engulf] = Card.new( #TODO
  title: "Elemental Engulf",
  blood: 2,
  #reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: 'Summon magic around your self.',
      symbol: [:blood, :greater]
    ),
  ],
  color: 'firebrick',
  #flavour: '"Alchemicals and fleshy masses."',
  type: 'Blood Spell Modified'
)

beginner_spells[:distance] = Card.new( #TODO
  title: "Distance Casting",
  blood: 2,
  #reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: 'Summon magic at a distance.',
      symbol: [:blood, :face]
    ),
  ],
  color: 'firebrick',
  #flavour: '"Alchemicals and fleshy masses."',
  type: 'Blood Spell Modified'
)

beginner_spells[:endure] = Card.new( #TODO
  title: "Enduring Arcana",
  blood: 0,
  #reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: 'Keep casting for a duration. Whenever distractions occurs to you while casting, such as an attack or a suprise, do a blood check with difficulty equal to the sum of the blood value of spell components used.',
      symbol: [:blood, :even]
    ),
  ],
  color: 'firebrick',
  #flavour: '"Alchemicals and fleshy masses."',
  type: 'Blood Spell Modified'
)

Card.output('beginner_spells', beginner_spells);
