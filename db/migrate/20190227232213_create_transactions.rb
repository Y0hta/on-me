class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :amount
      t.string :customer_name
      t.text :customer_message
      t.text :user_message

      t.timestamps
    end
  end
end
