class CreateAbordages < ActiveRecord::Migration[5.1]
  def change
    create_table :abordages do |t|
      t.references :tresor, foreign_key: true
      t.references :pirate, foreign_key: true
      t.text :message
      t.references :type_abordage, foreign_key: true
      t.boolean :accepte

      t.timestamps
    end
  end
end
