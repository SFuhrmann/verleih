class CreateSearches < ActiveRecord::Migration
  def self.up
    create_table :searches do |t|
      t.integer :user_id
      t.string :suche

      t.timestamps
    end
  end

  def self.down
    drop_table :searches
  end
end
