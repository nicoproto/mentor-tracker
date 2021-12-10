class CreateMentorees < ActiveRecord::Migration[6.1]
  def change
    create_table :mentorees do |t|
      t.string :github_username
      t.string :avatar_url
      t.string :name
      t.string :location
      t.string :email
      t.boolean :hireable
      t.integer :public_repos

      t.timestamps
    end
  end
end
