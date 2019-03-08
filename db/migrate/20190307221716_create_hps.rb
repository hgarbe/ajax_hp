class CreateHps < ActiveRecord::Migration[5.2]
  def change
    create_table :hps do |t|
      t.string :book
      t.string :house

      t.timestamps
    end
  end
end
