# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130529194232) do

  create_table "avatars", :force => true do |t|
    t.string  "image"
    t.string  "name"
    t.integer "user_id"
  end

  create_table "cart_items", :force => true do |t|
    t.integer "product_id", :null => false
    t.integer "cart_id"
    t.float   "price"
    t.string  "name"
    t.integer "user_id"
  end

  create_table "carts", :force => true do |t|
    t.integer "user_id"
  end

  create_table "categories", :force => true do |t|
    t.string  "name"
    t.string  "description"
    t.integer "featured_painting_id"
  end

  create_table "orders", :force => true do |t|
    t.integer  "cart_id"
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "paintings", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "paintable_type",   :limit => 50
    t.integer  "paintable_id"
    t.boolean  "home"
    t.integer  "category_id"
    t.boolean  "primary_painting",               :default => false
  end

  create_table "pictures", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  create_table "products", :force => true do |t|
    t.string  "name",                                   :null => false
    t.text    "description"
    t.decimal "price",                                  :null => false
    t.string  "size",                                   :null => false
    t.integer "user_id"
    t.integer "category_id"
    t.integer "primary_painting_id"
    t.boolean "sold",                :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",                                    :null => false
    t.string   "email",           :default => "no email"
    t.string   "username",                                :null => false
    t.integer  "age"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "password_digest"
    t.boolean  "admin"
    t.string   "user_link"
  end

end
