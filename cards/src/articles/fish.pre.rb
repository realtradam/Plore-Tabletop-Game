Justicar::PreProcessor.articles ||= {} # ensure the has exists

# assign the result to a hash to be generated later
Justicar::PreProcessor.articles["fish.html"] = Paggio.html! do
  h2 do
    "This is an article about FISH!"
  end
end
