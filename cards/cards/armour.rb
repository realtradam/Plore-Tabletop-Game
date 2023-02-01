require_relative 'card.rb'

armour = {}

armour[:iron_plate] = Card.new(
  title: "Iron Plate",
  defence: '5',
  #blood: 1,
  #reposte: 'Prc',
  #actions: [
    #Card::Action.new(
    #  content: '(**even**) Engulf your hand in flames for short while. You need to maintain concentration.',
    #  symbol: [:clubs, :blood]
    #),
    #Card::Action.new(
    #  seperator: true,
    #  content: '(**while concentrating**) Deal melee damage to a target with your flame engulfed hand. If the target is a small object set it on fire.',
    #  symbol: [:tap]
    #),
  #],
  color: 'cadetblue',
  flavour: '"Strong but heavy"',
  type: 'Body Armour'
)

armour[:chain_mail] = Card.new(
  title: "Chain Mail",
  defence: '4',
  color: 'cadetblue',
  flavour: '"The fairly lightweight option"',
  type: 'Body Armour'
)

armour[:leather] = Card.new(
  title: "Leather",
  defence: '3',
  color: 'cadetblue',
  flavour: '"Popular with goths and punks"',
  type: 'Body Armour'
)

armour[:padded] = Card.new(
  title: "Padded",
  defence: '2',
  color: 'cadetblue',
  flavour: '"A *LOT* of regular clothing stacked together"',
  type: 'Body Armour'
)

armour[:none] = Card.new(
  title: "None",
  defence: '1',
  color: 'cadetblue',
  flavour: '"Just the skin on your back"',
  type: 'Body Armour'
)

File.write('armour.html', Card.build(armour.values))

Card.output('armour', armour)
