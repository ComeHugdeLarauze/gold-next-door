class CreateCrewTresors < ActiveRecord::Migration[5.1]
  def change
    create_table :crew_tresors do |t|
      t.references :tresor, foreign_key: true
      t.references :crew, foreign_key: true

      t.timestamps
    end
  end
end
