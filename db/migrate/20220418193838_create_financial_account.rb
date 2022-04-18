class CreateFinancialAccount < ActiveRecord::Migration[7.0]
  def change
    if table_exists?(:financial_accounts)
      return
    end
    create_table :financial_accounts do |t|
      t.string :name
      t.string :financial_type

      t.timestamps
    end
  end
end
