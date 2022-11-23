class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :ride, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :finished

      t.timestamps
    end
  end
end
