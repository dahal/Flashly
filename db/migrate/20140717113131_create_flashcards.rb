class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table :flashcards do |f|
      f.string :question
      f.string :answer

      f.timestamps
    end
  end
end
