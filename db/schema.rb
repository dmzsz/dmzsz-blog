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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150406173357) do

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",         null: false
    t.string   "email_md5",              limit: 255
    t.boolean  "email_public",           limit: 1
    t.string   "encrypted_password",     limit: 255, default: "",         null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,          null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.string   "login",                  limit: 255
    t.string   "name",                   limit: 255
    t.string   "crypted_password",       limit: 255, default: "",         null: false
    t.string   "password_salt",          limit: 255, default: "",         null: false
    t.string   "persistence_token",      limit: 255, default: "",         null: false
    t.string   "single_access_token",    limit: 255, default: "",         null: false
    t.string   "perishable_token",       limit: 255, default: "",         null: false
    t.string   "avatar_file_name",       limit: 255
    t.string   "bio",                    limit: 255
    t.string   "qq",                     limit: 255
    t.string   "website",                limit: 255
    t.string   "company",                limit: 255
    t.string   "github",                 limit: 255
    t.string   "twitter",                limit: 255
    t.boolean  "verified",               limit: 1,   default: false
    t.integer  "state",                  limit: 4,   default: 1
    t.boolean  "guest",                  limit: 1,   default: false
    t.string   "tagline",                limit: 255
    t.integer  "topics_count",           limit: 4,   default: 0
    t.integer  "replies_count",          limit: 4,   default: 0
    t.string   "private_token",          limit: 255
    t.string   "favorite_topic_ids",     limit: 255, default: "--- []\n"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
