class CreateOpinions < ActiveRecord::Migration
  def self.up
    create_table :opinions do |t|
      t.integer :person_id
      t.integer :thing_id
      t.text :comment
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :opinions
  end
end
