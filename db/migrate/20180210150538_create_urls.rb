class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :token, limit: 8, null: false
      t.text :original_url, null: false

      t.timestamps
    end

    add_index :urls, :token, unique: true
  end
end
