get '/decks' do
  # "hello ducks"
  @decks = Deck.all
  erb:'/decks'
end
