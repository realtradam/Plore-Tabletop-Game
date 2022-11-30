require 'paggio'
require 'paggio/markdown'
class Card
  attr_accessor(
    :attrib_top_left,     :attrib_top_left_icon, 
    :attrib_top_right,    :attrib_top_right_icon,
    :attrib_bottom_left,  :attrib_bottom_left_icon,
    :attrib_bottom_right, :attrib_bottom_right_icon,
    :color,
    :title,
    :flavour,
    :type
  )

  def actions
    @actions ||= []
  end

  def initialize(
    title:,
    color:,
    attrib_top_right: nil,
    attrib_top_right_icon: '🩸',
    blood: nil,
    attrib_top_left: nil,
    attrib_top_left_icon: '🎲',
    roll: nil,
    attrib_bottom_right: nil,
    attrib_bottom_right_icon: '🛡️',
    reposte: nil,
    defence: nil,
    attrib_bottom_left: nil,
    attrib_bottom_left_icon: '⚔️',
    damage: nil,
    actions: [],
    flavour: nil,
    type: nil
  )
    attrib_top_right ||= blood.to_s unless blood.nil?
    attrib_bottom_right ||= defence.to_s unless defence.nil?
    attrib_bottom_right ||= reposte.to_s unless reposte.nil?
    attrib_bottom_left ||= damage.to_s unless damage.nil?
    attrib_top_left ||= roll.to_s unless roll.nil?
    self.title = title
    self.color = color
    self.attrib_top_left = attrib_top_left
    self.attrib_top_left_icon = attrib_top_left_icon
    self.attrib_top_right = attrib_top_right
    self.attrib_top_right_icon = attrib_top_right_icon
    self.attrib_bottom_right = attrib_bottom_right
    self.attrib_bottom_right_icon = attrib_bottom_right_icon
    self.attrib_bottom_left = attrib_bottom_left
    self.attrib_bottom_left_icon = attrib_bottom_left_icon
    self.actions.push *actions
    self.flavour = flavour
    self.type = type
  end

  class Action
    attr_accessor :content, :symbol, :seperator

    def initialize(content:, symbol: nil, seperator: false)
      self.content = content
      self.symbol = Array(symbol)
      self.seperator = seperator
    end

    def symbol
      @symbol ||= []
    end

  end

  class << self
    def build(cards)
      Paggio.html do |_|
        _.head do
          _.style do
            rule 'body' do
              background color: '#1e1e1e'
            end
            rule 'p' do
              margin 0
            end
            rule 'button' do
              font size: 50.px
              padding 30.px
              margin 30.px
            end
            rule '.card_wrapper' do
              min height: (1425 * 2).px
              width (825 * 7).px
              display :flex
              flex wrap: :wrap
              height 100.%
            end
            rule '.card' do
              height 1425.px
              width 825.px
              background color: :black
              display :flex
            end
            rule '.group' do
              margin '50px 50px 0px 50px'
              border radius: 25.px
              display :flex
              flex direction: :column
              #background color: :black
              align content: 'space-between'
              height :auto
              flex 2
              gap 35.px
            end
            rule '.title' do
              background color: :black
              color :antiquewhite
              flex 3
              border radius: 25.px
              overflow :hidden

              position :relative
              font size: 85.px
              display :flex
              align items: :center
              justify content: :center
              text align: :center
              flex direction: :column
              padding 25.px
              border width: '2px 2px 2px 2px'
              border color: :black
              border style: :solid
            end
            rule '.attrib_icon' do
              background color: 'rgba(255,255,255,0.10)'
            end
            rule '.attrib_tl' do
              position :absolute
              top 0
              left 0
              border radius: '0 0 50px 0'
              border color: 'rgba(255,255,255,0.50)'
              border style: :solid
              border width: '0 5px 5px 0'
              padding '15px 25px 15px 15px'
            end
            rule '.attrib_tr' do
              position :absolute
              top 0
              right 0
              border radius: '0 0 0 50px'
              border color: 'rgba(255,255,255,0.50)'
              border style: :solid
              border width: '0 0 5px 5px'
              padding '15px 15px 15px 25px'
            end
            rule '.attrib_br' do
              position :absolute
              bottom 0
              right 0
              border radius: '50px 0 0 0'
              border color: 'rgba(255,255,255,0.50)'
              border style: :solid
              border width: '5px 0 0 5px'
              padding '15px 15px 15px 25px'
            end
            rule '.attrib_bl' do
              position :absolute
              bottom 0
              left 0
              border radius: '0 50px 0 0'
              border color: 'rgba(255,255,255,0.50)'
              border style: :solid
              border width: '5px 5px 0 0'
              padding '15px 25px 15px 15px'
            end
            rule '.attrib_top_icons' do
              top 0
            end
            rule '.attrib_bottom_icons' do
              bottom 0
            end
            rule '.content' do
              background color: :antiquewhite
              color :black
              flex 5
              border radius: 25.px
              overflow :hidden
              position :relative

              font size: 50.px
              display :flex
              justify content: 'flex-start'
              gap 5.px
              text align: :left
              padding '35px 30px 30px 30px'
              flex direction: :column
              border width: '2px 2px 2px 2px'
              border color: :black
              border style: :solid
            end
            rule '.tap_icon' do
              background color: :black
            end
            rule '.joker_icon' do
              background color: :black
              padding '6px 3px 2px 5px'
            end
            rule '.blood_icon' do
              background color: :black
              padding '6px 3px 2px 5px'
            end
            rule '.suit_icon' do
              background color: :black
              text align: :center
              font size: 60.px
              line height: 40.px
            end
            rule '.spades_icon' do
              color :antiquewhite
            end
            rule '.clubs_icon' do
              color :antiquewhite
            end
            rule '.diamonds_icon' do
              color :orangered
            end
            rule '.hearts_icon' do
              color :orangered
            end
            rule '.odd_icon' do
              background color: :black
              padding '12px 0px 0px 12px'
              font size: 30.px
              height 48.px
              width 48.px
            end
            rule '.even_icon' do
              background color: :black
              padding '12px 0px 0px 12px'
              font size: 30.px
              height 48.px
              width 48.px
            end
            rule '.face_icon' do
              background color: :black
              #padding '12px 0px 0px 12px'
              #font size: 30.px
              #height 48.px
              #width 48.px
              padding '6px 3px 2px 5px'
            end
            rule '.icon' do
              display 'inline-block'
              padding '8px 4px 0px 4px'
              border radius: 15.px
              aspect ratio: '1/1'
              font size: 40.px
              height 52.px
              width 52.px
            end
            rule '.card_type' do
              background color: :antiquewhite
              text align: :center
              font size: 40.px
              padding 10.px
              border radius: '15px 15px 0 0'
              font weight: :bold
              border width: '2px 2px 0 2px'
              border color: :black
              border style: :solid
            end
            rule '.symbol_wrapper_outer' do
              display 'flex'
              gap 20.px
            end
            rule '.symbol_wrapper_inner' do
              display 'flex'
              flex direction: 'column'
              gap 5.px
            end
            rule '.action_detail' do
              padding top: 0.px
              text align: :left
            end
            rule '.flavour_wrapper' do
              position :absolute
              bottom 0
              left 0
              width 100.%
                text align: :center
            end
            rule '.flavour' do
              color 'rgba(0,0,0,0.5)'
              padding 35.px
              font size: 35.px
            end
          end
        end
      _.button onclick: "downloadAsImage()" do
        "Download"
      end
      _.div.card_wrapper.card_wrapper! do
        cards.each do |card|
          _.div.card(style: "background:linear-gradient(225deg, rgba(0,0,0,1) -50%, #{card.color} 100%)") do
            _.div.group do
              _.div.title do
                if card.attrib_top_left && card.attrib_top_left_icon
                  _.div.attrib_icon.attrib_tl do
                    card.attrib_top_left_icon + ' ' + card.attrib_top_left
                  end
                end
                if card.attrib_top_right && card.attrib_top_right_icon
                  _.div.attrib_icon.attrib_tr do
                    card.attrib_top_right + ' ' + card.attrib_top_right_icon
                  end
                end
                _.p card.title if card.title
                if card.attrib_bottom_left && card.attrib_bottom_left_icon
                  _.div.attrib_icon.attrib_bl do
                    card.attrib_bottom_left_icon + ' ' + card.attrib_bottom_left
                  end
                end
                if card.attrib_bottom_right && card.attrib_bottom_right_icon
                  _.div.attrib_icon.attrib_br do
                    card.attrib_bottom_right + ' ' + card.attrib_bottom_right_icon
                  end
                end
              end
              _.div.content do
                card.actions.each do |action|
                  _.div.action do
                    _.hr if action.seperator
                    if !action.symbol.empty?
                      _.div.symbol_wrapper_outer do
                        _.div.symbol_wrapper_inner do
                          #build_symbol
                          if action.symbol.include? :tap
                            _.span.icon.tap_icon do
                              "↪️"
                            end
                          end
                          if action.symbol.include? :spades
                            _.span.icon.suit_icon.spades_icon do
                              "♠️"
                            end
                          end
                          if action.symbol.include? :clubs
                            _.span.icon.suit_icon.clubs_icon do
                              "♣️"
                            end
                          end
                          if action.symbol.include? :diamonds
                            _.span.icon.suit_icon.diamonds_icon do
                              "♦️"
                            end
                          end
                          if action.symbol.include? :hearts
                            _.span.icon.suit_icon.hearts_icon do
                              "♥️"
                            end
                          end
                          if action.symbol.include? :joker
                            _.span.icon.joker_icon do
                              "🃏"
                            end
                          end
                          if action.symbol.include? :blood
                            _.span.icon.blood_icon do
                              "🩸"
                            end
                          end
                          if action.symbol.include? :odd
                            _.span.icon.odd_icon do
                              "🔻"
                            end
                          end
                          if action.symbol.include? :even
                            _.span.icon.even_icon do
                              "⬜"
                            end
                          end
                          if action.symbol.include? :face
                            _.span.icon.face_icon do
                              "🎭"
                            end
                          end
                        end
                        _.div.action_detail do
                          _.markdown <<-MD
              #{action.content}
                          MD
                        end
                      end
                    else
                      _.markdown <<-MD
            #{action.content}
                      MD
                    end
                  end
                end
                if card.flavour
                  _.div.flavour_wrapper do
                    _.div.flavour do
                      _.hr
                      _.markdown <<-MD
              #{card.flavour}
                      MD
                    end
                  end
                end
                #_.p do
                #  _.span.tap_icon do
                #    "↪️"
                #  end
                #  _.markdown <<-MD
                #    Attack with a 🎲 **d6** roll.  
                #    On success deal ⚔️ **2 damage**.
                #  MD
                #end
                ##p "↪️ My content will go here at some point."
                #_.p do
                #  _.span.face_icon do 
                #    "♠️"
                #  end
                #  _.text "My content will go here at some point."
                #end
                #_.div do
                #  _.hr
                #  _.p "this is just some flavour text"
                #end
              end
              _.div.card_type do
                card.type
              end
            end
          end
        end
      end
      _.script src: "./web/bundle.js"
      _.script do
        <<-SCRIPT
function downloadAsImage() {
  htmlToImage.toPng(document.getElementById('card_wrapper'))
    .then(function (dataUrl) {
      download(dataUrl, 'card_wrapper.png');
    });
}
        SCRIPT
      end
      end
    end
  end
end


