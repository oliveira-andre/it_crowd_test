class CreateMoviePerson < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_people do |t|
      t.references :person, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.integer :role, null: false, default: 0
    end
  end
end
