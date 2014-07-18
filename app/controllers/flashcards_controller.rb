# CRUD

#READ
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

# accept user answer and card id
post '/flashcards/:id' do
  if Flashcard.evaluate(params[:id], params[:answer])
    redirect '/right'
  else
    redirect '/wrong'
  end
end

# route to respond with RIGHT
get '/right' do
  'right'
end

# route to respond with WRONG
get '/wrong' do
  'wrong'
end



#_______________________________________________________________________
#CREATE

post '/flashcards/new' do
  @flashcard = Flashcard.create(params)
  redirect '/'
end



#_______________________________________________________________________
#UPDATE

put '/flashcards/:id' do |id|
  @flashcard = Flashcard.find_by_id(id)
  redirect ("/flashcards/confirm_edit/#{id}")
end

get '/flashcards/confirm_edit/:id' do |id|
  @flashcard = Flashcard.find_by_id(id)
  erb:'/flashcards/edit'
end


#_______________________________________________________________________
#DELETE

delete '/flashcards/:id' do |id|
  "you got to the delete route for card id number #{id}"
  @flashcard = Flashcard.find_by_id(id)
  redirect ("/flashcards/confirm_delete/#{id}")
end

get '/flashcards/confirm_delete/:id' do |id|
  @flashcard = Flashcard.find_by_id(id)
  erb:'/flashcards/delete'
end

post '/flashcards/confirm_delete/:id' do |id|
  if params[:delete] == 'CANCEL'
    redirect("/flashcards/#{id}")
  elsif params[:delete] == 'OK'
    "delete page for card number #{id} ||| value of 'delete' is: #{params[:delete]}"
  end
end
