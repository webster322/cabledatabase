class CreateCables < ActiveRecord::Migration[5.1]
  def change
    create_table :cables do |t|
      t.string :name
      t.string :from
      t.string :to

      t.timestamps
    end
  end
end
