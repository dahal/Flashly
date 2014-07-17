class Flashcard < ActiveRecord::Base
  def self.evaluate(id, user_answer)
    card = Flashcard.find_by_id(id)
    card.answer == user_answer
  end

  def update
  end

  def delete
  end

end
