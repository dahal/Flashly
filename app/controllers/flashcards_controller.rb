# CRUD

#index
#read
#landing page, pick card at random and redirect to
#that card's URL
get '/' do
  @flashcard = Flashcard.all.sample
  redirect("/flashcards/#{@flashcard.id}")
end

# route to a particular card (by id)
get '/flashcards/:id' do
  @flashcard = Flashcard.find_by_id(params[:id])
  erb:'/flashcards/index'
end

#accept user answer and card id
post '/flashcards/:id' do
  if Flashcard.evaluate(params[:id], params[:answer])
    redirect '/right'
  else
    redirect '/wrong'
  end
# call model logic pass in the card id and the user answer
# conditial redirect to right or wrong
end

# route to respond with RIGHT
get '/right' do
  'right'
end

# route to respond with WRONG
get '/wrong' do
  'wrong'
end




#create
#new
get '/flashcards/new' do
  erb:'/flashcards/new'
end

post '/flashcards/new' do
  @flashcard = Flashcard.create(params)
  redirect '/'
end

#update
#edit
put '/flashcards/:id' do |id|
  "you got to the edit route for card id number #{id}"
  #code to delete the card with the passed in id (from url)
end

#delete
#destroy

delete '/flashcards/:id' do |id|
  "you got to the delete route for card id number #{id}"
  #code to delete the card with the passed in id (from url)
end
