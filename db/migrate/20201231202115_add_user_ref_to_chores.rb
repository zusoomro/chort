class AddUserRefToChores < ActiveRecord::Migration[6.1]
  def change
    add_reference :chores, :user, foreign_key: true, on_delete: :cascade
  end
end
