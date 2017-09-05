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

ActiveRecord::Schema.define(version: 20170703035525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "trackable_type"
    t.integer  "trackable_id"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "key"
    t.text     "parameters"
    t.string   "recipient_type"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree
  end

  create_table "addresses", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "head_office"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["company_id"], name: "index_addresses_on_company_id", using: :btree
  end

  create_table "benefits", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["company_id"], name: "index_benefits_on_company_id", using: :btree
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_bookmarks_on_job_id", using: :btree
    t.index ["user_id"], name: "index_bookmarks_on_user_id", using: :btree
  end

  create_table "candidates", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.integer  "interested_in", default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "process",       default: 0
    t.index ["job_id"], name: "index_candidates_on_job_id", using: :btree
    t.index ["user_id", "job_id"], name: "index_candidates_on_user_id_and_job_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_candidates_on_user_id", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.text     "introduction"
    t.string   "founder"
    t.string   "country"
    t.integer  "company_size"
    t.date     "founder_on"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "avatar_id"
    t.integer  "cover_image_id"
    t.integer  "creator_id"
    t.index ["avatar_id", "cover_image_id"], name: "index_companies_on_avatar_id_and_cover_image_id", unique: true, using: :btree
    t.index ["creator_id"], name: "index_companies_on_creator_id", using: :btree
    t.index ["name"], name: "index_companies_on_name", using: :btree
    t.index ["website"], name: "index_companies_on_website", using: :btree
  end

  create_table "company_industries", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "industry_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["company_id"], name: "index_company_industries_on_company_id", using: :btree
    t.index ["industry_id"], name: "index_company_industries_on_industry_id", using: :btree
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "description"
    t.date     "start_time"
    t.integer  "role"
    t.integer  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["company_id"], name: "index_employees_on_company_id", using: :btree
    t.index ["user_id"], name: "index_employees_on_user_id", using: :btree
  end

  create_table "follows", force: :cascade do |t|
    t.string   "followable_type"
    t.integer  "followable_id",                   null: false
    t.string   "follower_type"
    t.integer  "follower_id",                     null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["followable_id", "followable_type"], name: "fk_followables", using: :btree
    t.index ["follower_id", "follower_type"], name: "fk_follows", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["company_id"], name: "index_groups_on_company_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "picture"
    t.text     "caption"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["imageable_id"], name: "index_images_on_imageable_id", using: :btree
    t.index ["imageable_type"], name: "index_images_on_imageable_type", using: :btree
  end

  create_table "industries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "info_users", force: :cascade do |t|
    t.integer  "relationship_status"
    t.text     "introduce"
    t.string   "quote"
    t.string   "ambition"
    t.string   "phone"
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.text     "info_statuses"
    t.index ["user_id"], name: "index_info_users_on_user_id", using: :btree
  end

  create_table "job_skills", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_job_skills_on_job_id", using: :btree
    t.index ["skill_id"], name: "index_job_skills_on_skill_id", using: :btree
  end

  create_table "job_teams", force: :cascade do |t|
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_job_teams_on_job_id", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "title"
    t.string   "describe"
    t.integer  "type_of_candidates",      default: 0
    t.integer  "who_can_apply",           default: 0
    t.integer  "status",                  default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "{:foreign_key=>true}_id"
    t.datetime "deleted_at"
    t.string   "profile_requests",        default: "[]", null: false
    t.integer  "candidates_count",        default: 0
    t.datetime "posting_time"
    t.integer  "user_id"
    t.index ["company_id"], name: "index_jobs_on_company_id", using: :btree
    t.index ["deleted_at"], name: "index_jobs_on_deleted_at", using: :btree
    t.index ["title"], name: "index_jobs_on_title", using: :btree
    t.index ["user_id"], name: "index_jobs_on_user_id", using: :btree
    t.index ["{:foreign_key=>true}_id"], name: "index_jobs_on_{:foreign_key=>true}_id", using: :btree
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.integer  "org_type",   default: 1
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["name"], name: "index_organizations_on_name", using: :btree
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "entry"
    t.text     "optional"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_permissions_on_group_id", using: :btree
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_positions_on_company_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "author_id"
    t.integer  "likes_count",    default: 0
    t.integer  "comments_count", default: 0
    t.string   "postable_type"
    t.integer  "postable_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "image"
    t.index ["postable_type", "postable_id"], name: "index_posts_on_postable_type_and_postable_id", using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "share_jobs", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "shareable_id"
    t.string   "shareable_type"
    t.index ["shareable_id"], name: "index_share_jobs_on_shareable_id", using: :btree
    t.index ["user_id"], name: "index_share_jobs_on_user_id", using: :btree
  end

  create_table "skill_users", force: :cascade do |t|
    t.integer  "skill_id"
    t.integer  "user_id"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_skill_users_on_skill_id", using: :btree
    t.index ["user_id"], name: "index_skill_users_on_user_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "social_networks", force: :cascade do |t|
    t.integer  "social_network_type"
    t.string   "url"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["owner_type", "owner_id"], name: "index_social_networks_on_owner_type_and_owner_id", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "user_educations", force: :cascade do |t|
    t.string   "major"
    t.date     "graduation"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "school_id"
    t.index ["school_id"], name: "index_user_educations_on_school_id", using: :btree
    t.index ["user_id"], name: "index_user_educations_on_user_id", using: :btree
  end

  create_table "user_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "position_id"
    t.boolean  "is_default_group"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["group_id"], name: "index_user_groups_on_group_id", using: :btree
    t.index ["position_id"], name: "index_user_groups_on_position_id", using: :btree
    t.index ["user_id"], name: "index_user_groups_on_user_id", using: :btree
  end

  create_table "user_languages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "language_id"
    t.integer  "level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["language_id"], name: "index_user_languages_on_language_id", using: :btree
    t.index ["user_id"], name: "index_user_languages_on_user_id", using: :btree
  end

  create_table "user_portfolios", force: :cascade do |t|
    t.string   "url"
    t.string   "title"
    t.text     "description"
    t.date     "time"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_user_portfolios_on_user_id", using: :btree
  end

  create_table "user_works", force: :cascade do |t|
    t.string   "position"
    t.text     "description"
    t.integer  "status"
    t.date     "start_time"
    t.date     "end_time"
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_user_works_on_organization_id", using: :btree
    t.index ["user_id"], name: "index_user_works_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "phone"
    t.integer  "role",                   default: 0
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "education_status",       default: 1
    t.integer  "cover_image_id"
    t.integer  "avatar_id"
    t.string   "provider"
    t.integer  "company_id"
    t.index ["avatar_id"], name: "index_users_on_avatar_id", using: :btree
    t.index ["cover_image_id"], name: "index_users_on_cover_image_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "company_industries", "companies"
  add_foreign_key "company_industries", "industries"
  add_foreign_key "groups", "companies"
  add_foreign_key "info_users", "users"
  add_foreign_key "job_teams", "jobs"
  add_foreign_key "jobs", "users"
  add_foreign_key "permissions", "groups"
  add_foreign_key "positions", "companies"
  add_foreign_key "share_jobs", "users"
  add_foreign_key "user_educations", "schools"
  add_foreign_key "user_educations", "users"
  add_foreign_key "user_groups", "groups"
  add_foreign_key "user_groups", "positions"
  add_foreign_key "user_groups", "users"
  add_foreign_key "user_languages", "languages"
  add_foreign_key "user_languages", "users"
  add_foreign_key "user_portfolios", "users"
  add_foreign_key "user_works", "organizations"
  add_foreign_key "user_works", "users"
end
