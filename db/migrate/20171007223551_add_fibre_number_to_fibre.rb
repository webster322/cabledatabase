class AddFibreNumberToFibre < ActiveRecord::Migration[5.1]
  def change
    add_column :fibres, :number, :integer
  end
end
