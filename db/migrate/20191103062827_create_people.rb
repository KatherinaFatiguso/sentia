class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :locations
      t.string :species
      t.string :gender
      t.string :affiliations

      t.timestamps
    end
  end
end
