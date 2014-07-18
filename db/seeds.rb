#Users
User.create(name:'Gannon Curran', email:'gannoncurran@mac.com', password:'password', role:'admin')
User.create(name:'Puru Dahal', email:'puru@dahal.me', password:'password', role:'admin')
User.create(name:'student', email:'student@email.com', password:'student', role:'student')

#Decks
Deck.create(theme: 'Sinatra')
Deck.create(theme: 'Rails')
#Flash Cards
Flashcard.create(question: 'While drying, what is the thing that gets wet?', answer: 'a towel')
Flashcard.create(question: 'They have banks. But no money! What are they?', answer: 'rivers')
Flashcard.create(question: 'What will a trendy frog like to wear?', answer: 'jumpsuits')
Flashcard.create(question: 'What is the thing that has only a neck, but no head?', answer: 'a bottle')
Flashcard.create(question: 'What you can never eat during lunch or supper?', answer: 'breakfast')
Flashcard.create(question: 'Is DBC rad?', answer: 'Yes', deck_id: 1)
Flashcard.create(question: 'Is icecream bad?', answer: 'No', deck_id: 2)
