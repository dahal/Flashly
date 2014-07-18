


# CRUD

#READ
#landing page, pick card at random and redirect to
#that card's URL

get '/flashcards/index' do
  @flashcard = Flashcard.all.sample
  redirect("/flashcards/#{@flashcard.id}")
end

# route to a particular card (by id)
get '/flashcards/:id' do |id|
  @flashcard = Flashcard.where(id:id).first
  erb:'/flashcards/index'
end

# accept user answer and card id
post '/flashcards/:id' do |id|
  if Flashcard.evaluate(id, params[:answer])
    redirect "/flashcards/#{id}/correct"
  else
    redirect "/flashcards/#{id}/wrong"
  end
end

# route to respond with correct
get '/flashcards/:id/correct' do |id|
  @flashcard = Flashcard.where(id:id).first
  erb:'/flashcards/correct'
end

# route to respond with WRONG
get '/flashcards/:id/wrong' do |id|
  @flashcard = Flashcard.where(id:id).first
  erb:'/flashcards/wrong'
end



#_______________________________________________________________________
#CREATE

post 'xxxxxx' do
  @flashcard = Flashcard.create(params)
  redirect '/'
end



#_______________________________________________________________________
#UPDATE

put '/flashcards/:id' do |id|
  @flashcard = Flashcard.where(id:id).first
  redirect ("/flashcards/confirm_edit/#{id}")
end

get '/flashcards/confirm_edit/:id' do |id|
  @flashcard = Flashcard.where(id:id).first
  erb:'/flashcards/edit'
end

# post '/flashcards/confirm_edit/:id' do |id|
#   @flashcard = Flashcard.where(id:id).first
#   @flashcard.update_attributes(params)
# end

post '/flashcards/confirm_edit/:id' do |id|
  if params[:edit] == 'CANCEL'
    redirect("/flashcards/#{id}")
  elsif params[:edit] == 'SAVE'
    @flashcard = Flashcard.where(id:id).first
    @flashcard.question = params[:question]
    @flashcard.answer = params[:answer]
    @flashcard.save
    erb:'/flashcards/edit_conf'
  end
end


#_______________________________________________________________________
#DELETE

delete '/flashcards/:id' do |id|
  @flashcard = Flashcard.where(id:id).first
  redirect ("/flashcards/confirm_delete/#{id}")
end

get '/flashcards/confirm_delete/:id' do |id|
  @flashcard = Flashcard.where(id:id).first
  erb:'/flashcards/delete'
end

post '/flashcards/confirm_delete/:id' do |id|
  if params[:delete] == 'CANCEL'
    redirect("/flashcards/#{id}")
  elsif params[:delete] == 'DELETE IT ALREADY'
    @flashcard = Flashcard.where(id:id).first
    Flashcard.delete(id)
    erb:'/flashcards/delete_conf'
  end
end
