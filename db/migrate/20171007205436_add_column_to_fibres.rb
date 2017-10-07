class AddColumnToFibres < ActiveRecord::Migration[5.1]
  def change
    add_column :fibres, :cabinet_name, :string
    add_column :fibres, :room, :string
  end
end
