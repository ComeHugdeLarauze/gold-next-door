class AddVenduToTresor < ActiveRecord::Migration[5.1]
  def change
    add_column :tresors, :vendu, :boolean
  end
end
