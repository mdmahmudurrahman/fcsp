class CreateSkillUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :skill_users do |t|
      t.float :years
      t.integer :user_id
      t.integer :skill_id
      t.string :description

      t.timestamps
    end
  end
end
