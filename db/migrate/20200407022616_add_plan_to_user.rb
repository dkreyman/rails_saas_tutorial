class AddPlanToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :user, :plan_id, :integer
  end
end
