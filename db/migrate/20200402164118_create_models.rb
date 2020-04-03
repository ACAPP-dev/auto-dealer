class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :carnames do |t|
      t.string :name
      t.string :description
      t.string :features
      
      t.timestamps
    end
  end
end
