RSpec.describe "Transaction", :type => :model do
	it "is valid with valid attributes" do
		f_a = FinancialAccount.create(
				name: "ExampleCard for transaction_spec",
				financial_type: "Expense")
		tx = Transaction.create(unix_time: Time.now,
				amount_cents: 871,
				desc: "ExampleMerchant transaction",
				account_in: f_a.id)
		expect(tx).to be_valid
	end
end