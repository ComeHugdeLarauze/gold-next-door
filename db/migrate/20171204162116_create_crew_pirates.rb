class CreateCrewPirates < ActiveRecord::Migration[5.1]
  def change
    create_table :crew_pirates do |t|
      t.references :crew, foreign_key: true
      t.references :pirate, foreign_key: true

      t.timestamps
    end
  end
end
