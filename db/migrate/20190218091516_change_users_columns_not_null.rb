class ChangeUsersColumnsNotNull < ActiveRecord::Migration[5.1]
  # NOT NULL制約を追加
  def change
    change_column_null :users, :name, false
    change_column_null :users, :email, false
    change_column_null :users, :password_digest, false
  end
end
