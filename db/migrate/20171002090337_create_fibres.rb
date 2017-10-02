class CreateFibres < ActiveRecord::Migration[5.1]
  def change
    create_table :fibres do |t|
      t.string :name
      t.string :location
      t.boolean :busy
      t.boolean :damage
      t.string :system

      t.timestamps
    end
  end
end
