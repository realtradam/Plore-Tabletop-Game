Justicar::PreProcessor.articles ||= {} # ensure the has exists

# assign the result to a hash to be generated later
Justicar::PreProcessor.articles["lion.html"] = Paggio.html! do
  h2 do
    "This is an article about LIONS!"
  end
end

def event_card(title, description, image = nil)
  Paggio.html! do
    div.card do
      div.top_card do
        div.title_card do
          title
        end
        div.background_image_card do
          div.image_card(style: "background-image: url('#{image}');") do
          end
        end
      end
      div.bottom_card do
        div.content_card do
          description
        end
      end
    end
  end
end
