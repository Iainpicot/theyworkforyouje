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

ActiveRecord::Schema.define(version: 20171028133430) do

  create_table "import_politicians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "fk_rails_984b9c27bc"
  end

  create_table "offices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parishes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "politicians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "parish_id"
    t.string "full_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "title"
    t.string "avatar"
    t.text "summary"
    t.string "address"
    t.string "mobile"
    t.string "fax"
    t.string "parish"
    t.string "landline"
    t.index ["parish_id"], name: "fk_rails_a52db85833"
  end

  create_table "propositions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "politician_id"
    t.string "prop_name"
    t.datetime "prop_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "lodged_by"
    t.string "debate_date"
    t.string "prop_pdf"
    t.string "minutes_pdf"
    t.string "hansard_pdf"
    t.string "vote_id"
    t.string "status"
    t.string "p_id"
    t.index ["politician_id"], name: "fk_rails_90bd012afd"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scraped_props", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "p_id", null: false, collation: "latin1_swedish_ci"
    t.string "lodged_by", null: false
    t.string "prop_name", null: false
    t.string "prop_date", null: false, collation: "latin1_swedish_ci"
    t.string "debate_date", null: false, collation: "latin1_swedish_ci"
    t.string "prop_pdf", null: false, collation: "latin1_swedish_ci"
    t.string "minutes_pdf", null: false, collation: "latin1_swedish_ci"
    t.string "hansard_pdf", null: false, collation: "latin1_swedish_ci"
    t.string "vote_id", null: false, collation: "latin1_swedish_ci"
    t.string "status", null: false, collation: "latin1_swedish_ci"
    t.index ["p_id"], name: "p_id", unique: true
  end

  create_table "terms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "begin_date"
    t.datetime "end_date"
    t.bigint "parishes_id"
    t.bigint "politician_id"
    t.bigint "offices_id"
    t.index ["offices_id"], name: "index_terms_on_offices_id"
    t.index ["parishes_id"], name: "index_terms_on_parishes_id"
    t.index ["politician_id"], name: "index_terms_on_politician_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id"
    t.string "created_by"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "propositions_id"
    t.string "member_position"
    t.string "member_name"
    t.index ["propositions_id"], name: "index_votes_on_propositions_id"
  end

  add_foreign_key "notices", "users"
  add_foreign_key "politicians", "parishes"
  add_foreign_key "propositions", "politicians"
end
