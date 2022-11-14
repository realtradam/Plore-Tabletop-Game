load 'card.rb'

alchemical_recipes = {}

beginner_spells[:crystal_encasement] = Card.new(
  title: "Crystal Encasement Recipe",
  #damage: 3,
  #blood: 2,
  #reposte: 'Prc',
  actions: [
    Card::Action.new(
      content: 'A potion which when applied to a surface quickly grows strong blue crystals. Can also be thrown.',
      symbol: [:diamonds, :blood]
    ),
  ],
  color: 'firebrick',
  flavour: '"You arent making a bomb, are you?"',
  type: 'Blood Magic (Eldritch)'
)

File.write('beginner_spells.html', Card.build(beginner_spells.values))
