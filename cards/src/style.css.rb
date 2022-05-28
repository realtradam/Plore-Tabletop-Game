Paggio.css do
  rule 'body' do
    height 100.vh
  end

  rule '.justicar' do
    top 134.px
    left 400.px
    opacity 0.7
    position 'absolute'
    width 400.px
    height 'auto'
  end

  rule '.opal' do
    color :dodgerblue
  end

  rule '.paggio' do
    color :goldenrod
  end

  rule '.articles' do
    color :limegreen
    max width: 400.px
  end

  rule 'h1' do
    font style: :italic
  end
  rule '.card' do
    display :flex
    flex direction: :column
    background color: :darkblue
    color :white
    height 36.em
    width 21.em
    border radius: 0.5.em
    overflow :hidden
  end
  rule '.top_card' do
    flex 8
    display :flex
    flex direction: :column
    padding 1.em
    padding bottom: 0.5.em
    padding top: 0.5.em
    #background color: :pink
  end
  rule '.background_image_card' do
    flex 1
    display :flex
    border :solid
    border width: 2.px
    border radius: '0em 0em 0.5em 0.5em'
    border color: :orange
    background color: :black
    overflow :hidden
  end
  rule '.image_card' do
    flex 1
    background repeat: 'no-repeat'
    background size: :cover
    background position: 'center center'
  end
  rule '.bottom_card' do
    flex 10
    display :flex
    padding 1.em
    padding top: 0.5.em
    #background color: :red
  end
  rule '.title_card' do
    border radius: '0.5em 0.5em 0em 0em'
    font size: 2.em
    color :orange
    padding 0.1.em
    #background color: :orange
    text align: :center
  end
  rule '.content_card' do
    flex 1
    border :solid
    padding 0.5.em
    font size: 1.25.em
    border width: 2.px
    border radius: 0.5.em
    border color: :orange
  end
end
