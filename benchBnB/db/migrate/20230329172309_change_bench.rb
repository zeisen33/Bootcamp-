class ChangeBench < ActiveRecord::Migration[7.0]
  def change
    change_column_default :benches, :seating, 2
  end
end
