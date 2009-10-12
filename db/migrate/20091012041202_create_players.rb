class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :email
      t.string :username
      t.string :password_salt
      t.string :password_hash
      t.integer :textmarks_uid
      t.string :textmarks_phone

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
