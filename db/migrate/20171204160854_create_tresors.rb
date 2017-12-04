class CreateTresors < ActiveRecord::Migration[5.1]
  def change
    create_table :tresors do |t|
      t.string :titre
      t.string :photo
      t.text :description
      t.boolean :prive
      t.string :indice
      t.references :pirate, foreign_key: true

      t.timestamps
    end
  end
end
