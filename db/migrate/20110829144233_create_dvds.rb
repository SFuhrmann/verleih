class CreateDvds < ActiveRecord::Migration
  def self.up
    create_table :dvds do |t|
      t.string :name
      t.string :beschreibung
      t.integer :verliehen
      t.string :userids
      t.integer :anzahl
	  t.string :bild
	  t.string :genre
	  t.string :tags

      t.timestamps
    end
  end

  def self.down
    drop_table :dvds
  end
end
