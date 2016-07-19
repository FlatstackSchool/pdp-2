class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :company, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :owner, index: true

      t.timestamps null: false
    end
  end
end
