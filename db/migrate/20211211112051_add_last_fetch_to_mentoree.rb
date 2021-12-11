class AddLastFetchToMentoree < ActiveRecord::Migration[6.1]
  def change
    add_column :mentorees, :last_fetch, :datetime
  end
end
