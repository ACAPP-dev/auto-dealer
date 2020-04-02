class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :description
      t.string :link_to_photo
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
