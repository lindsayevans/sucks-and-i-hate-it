class CreateThings < ActiveRecord::Migration
  def self.up
    create_table :things do |t|
      t.string :name
      t.string :url
      t.column :type, "set('it','them','him','her')", :default => 'it'

      t.timestamps
    end
  end

  def self.down
    drop_table :things
  end
end
