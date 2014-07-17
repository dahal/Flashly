class Deck < ActiveRecord::Base
  has_many :users_flashcards
  has_many :flashcards, :through => :users_flashcards
end
