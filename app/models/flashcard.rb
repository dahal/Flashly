class Flashcard < ActiveRecord::Base
  belongs_to :deck
  def self.evaluate(id, user_answer)
    card = Flashcard.find_by_id(id)
    card.answer == user_answer
  end
end
