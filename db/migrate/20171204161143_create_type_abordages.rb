class CreateTypeAbordages < ActiveRecord::Migration[5.1]
  def change
    create_table :type_abordages do |t|
      t.string :nom
      t.string :emoji

      t.timestamps
    end
  end
end
