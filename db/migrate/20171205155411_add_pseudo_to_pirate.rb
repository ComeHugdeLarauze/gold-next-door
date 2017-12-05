class AddPseudoToPirate < ActiveRecord::Migration[5.1]
  def change
    add_column :pirates, :pseudo, :string
  end
end
