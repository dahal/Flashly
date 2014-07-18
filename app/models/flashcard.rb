class Flashcard < ActiveRecord::Base
  belongs_to :deck
  def self.evaluate(id, user_answer)
    card = Flashcard.find_by_id(id)
    card.answer.downcase == user_answer.downcase
  end

  def update
  end

  def delete(id)
    Flashcard.destroy(id)
  end

end
