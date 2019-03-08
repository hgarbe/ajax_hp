class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :quote
      t.belongs_to :hp, foreign_key: true

      t.timestamps
    end
  end
end
