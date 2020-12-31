class CreateHomesUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :homes_users do |t|
      t.references :home, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
