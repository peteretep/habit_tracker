class DefaultStreakLength < ActiveRecord::Migration
  def change
    change_column_default :habits, :streak, 0
    
  end
end
