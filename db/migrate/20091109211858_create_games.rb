class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :title
      t.decimal :geo_tl_lat
      t.decimal :geo_tl_lon
      t.decimal :geo_br_lat
      t.decimal :geo_br_lon
      t.datetime :start
      t.integer :duration
      t.integer :puppetmaster_id

      t.timestamps
    end
    
    change_table :teams do |t|
      t.integer :game_id
    end
  end

  def self.down
    drop_table :games
    
    change_table :teams do |t|
      t.remove :game_id
    end
  end
end
