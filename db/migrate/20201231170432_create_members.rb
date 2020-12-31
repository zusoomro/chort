class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.references :home, null: false, foreign_key: true, on_delete: :cascade
      t.references :user, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
