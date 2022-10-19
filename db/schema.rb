# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_10_19_002332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "emitters", force: :cascade do |t|
    t.string "name"
    t.string "rfc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "emitter_id"
    t.bigint "receiver_id"
    t.bigint "zip_file_id"
    t.string "amount"
    t.string "currency"
    t.datetime "emitted_at"
    t.datetime "expires_at"
    t.datetime "signed_at"
    t.string "invoice_uuid"
    t.integer "status", default: 0
    t.string "cfdi_digital_stamp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["emitter_id"], name: "index_invoices_on_emitter_id"
    t.index ["receiver_id"], name: "index_invoices_on_receiver_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
    t.index ["zip_file_id"], name: "index_invoices_on_zip_file_id"
  end

  create_table "receivers", force: :cascade do |t|
    t.string "name"
    t.string "rfc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "last_name", null: false
    t.string "display_name"
    t.string "phone", null: false
    t.string "rfc", null: false
    t.string "locale", default: "en"
    t.string "logo", default: "default.png"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zip_files", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.string "success", default: [], array: true
    t.string "failed", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
