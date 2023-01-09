class Array
  def deep_copy
    Marshal.load(Marshal.dump(self))
  end
  def mean
    return 0 if self.length.zero?
    self.sum.to_f / self.length.to_f
  end
  def median
    return 0 if self.length.zero?
    sorted = self.sort
    mid = (sorted.length - 1).to_f / 2.0
    (sorted[mid.floor] + sorted[mid.ceil]).to_f / 2.0
  end
  def mode
    return 0 if self.length.zero?
    self.group_by(&:itself).values.max_by(&:size).first.to_f
  end
end

suits = [:s,:c,:h,:d]
ten = (1..10).to_a
courts = [:k, :q, :r, :j]
@cards = suits.map do |suit|
  ten.map do |num|
    [suit, num.to_s]
  end + courts.map do |court|
    [suit, court]
  end
end
@cards.flatten!

def test_multi(iterations, *block_params, &block)
  results = []
  iterations.times do
    results.push block.call(*block_params)
  end
  "Mean:   " + results.mean.to_s +
    "\nMedian: " + results.median.to_s +
    "\nMode:   " + results.mode.to_s +
    "\nDistribution:\n" +
    results.group_by(&:itself).map do |key, value|
      [key, value.size.to_f / results.size]
    end.to_h.sort_by do |key, value|
      [-value, key]
    end.to_h.to_s
end

basic_match = ->(player_hand_size = 3, dm_hand_size = 3) do
  dm_deck = @cards.shuffle
  player_deck = @cards.shuffle

  dm_hand = dm_deck[0...dm_hand_size]
  player_hand = player_deck[0...player_hand_size]
  dup_dm_hand = dm_hand.clone
  dup_player_hand = player_hand.clone
  matches = 0

  dm_hand.reverse_each do |dm_card|
    card_paired = false
    player_hand.reverse_each do |player_card|
      if player_card == dm_card
        dm_hand.delete dm_card
        player_hand.delete player_card
        card_paired = true
        matches += 1
        next
      end
      next if card_paired
    end
  end

  matches
end
#test_multi(20_000, 3, 3, &basic_match)
result = ""
3.times do |play|
  6.times do |dm|
    play_mod = (play + 2)
    dm_mod = (dm + 1)
    result += "player: #{play_mod}\n"
    result += "dm    : #{dm_mod}\n"
    result += test_multi(200_000, dm_mod, play_mod, &basic_match) + "\n\n"
  end
end

File.write('temp.txt', result)
