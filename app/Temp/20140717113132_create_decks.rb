class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |f|
      f.string :question
      f.string :answer

      f.timestamps
    end
  end
end
