class CreateUserMentorees < ActiveRecord::Migration[6.1]
  def change
    create_table :user_mentorees do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mentoree, null: false, foreign_key: true

      t.timestamps
    end
  end
end
