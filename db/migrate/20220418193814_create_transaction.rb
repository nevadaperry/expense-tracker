class CreateTransaction < ActiveRecord::Migration[7.0]
  def change
    if table_exists?(:transactions)
      return
    end
    create_table :transactions do |t|
      t.integer :unix_time
      t.integer :amount_cents
      t.string :desc
      t.integer :account_in

      t.timestamps
    end
  end
end
