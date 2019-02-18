class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
    # emailカラムにインデックスを追加してユニーク制限を保証する
    add_index :users, :email, unique: true
  end
end
