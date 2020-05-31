class AddNewIndexToTopic < ActiveRecord::Migration[5.2]
  def change
    change_column_default :topics, :view_count, 0
  end
end
