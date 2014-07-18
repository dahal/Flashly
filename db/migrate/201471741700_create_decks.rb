class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |f|
      f.string   :theme
      f.timestamps
    end
  end
end
