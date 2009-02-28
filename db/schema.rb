# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090228012823) do

# Could not dump table "opinions" because of following StandardError
#   Unknown type 'set('love','hate')' for column 'type'

  create_table "people", :force => true do |t|
    t.string   "username"
    t.string   "full_name"
    t.string   "openid_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "things" because of following StandardError
#   Unknown type 'set('it','them','him','her')' for column 'type'

end
