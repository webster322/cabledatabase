class RemoveBusyColumnAndAddShelfColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :fibres, :busy
    add_column :fibres, :shelf, :string
  end
end
