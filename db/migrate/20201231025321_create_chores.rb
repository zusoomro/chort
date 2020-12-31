class CreateChores < ActiveRecord::Migration[6.1]
  def change
    create_table :chores do |t|
      t.string :name
      t.text :description
      t.references :home, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
