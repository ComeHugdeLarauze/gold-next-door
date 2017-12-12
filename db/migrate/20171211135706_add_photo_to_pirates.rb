class AddPhotoToPirates < ActiveRecord::Migration[5.1]
  def change
    add_column :pirates, :photo, :string
  end
end
