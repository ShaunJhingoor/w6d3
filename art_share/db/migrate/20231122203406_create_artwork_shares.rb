class CreateArtworkShares < ActiveRecord::Migration[7.1]
  def change
    create_table :artwork_shares do |t|
      t.references :viewer, foreign_key: { to_table: :users }, null: false
      t.references :artwork, foreign_key: true, null: false

      t.timestamps
    end
    add_index :artwork_shares, %i[artwork_id viewer_id], unique: true
  end
end
