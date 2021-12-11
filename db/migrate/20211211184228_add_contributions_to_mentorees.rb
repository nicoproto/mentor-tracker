class AddContributionsToMentorees < ActiveRecord::Migration[6.1]
  def change
    add_column :mentorees, :year_contributions, :integer
  end
end
