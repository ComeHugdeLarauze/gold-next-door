class CreateCrews < ActiveRecord::Migration[5.1]
  def change
    create_table :crews do |t|
      t.string :nom
      t.boolean :prive
      t.string :password

      t.timestamps
    end
  end
end
