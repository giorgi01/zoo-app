class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :specie
      t.string :breed
      t.string :gender
      t.integer :age

      t.timestamps
    end
  end
end
