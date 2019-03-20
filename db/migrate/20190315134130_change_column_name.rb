class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column Notebook, :userid, :user_id
  end
end
