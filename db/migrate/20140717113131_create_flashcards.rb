class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table   :flashcards do |f|
      f.belongs_to :deck
      f.integer    :deck_id
      f.string     :question
      f.string     :answer
      f.timestamps
    end
  end
end
