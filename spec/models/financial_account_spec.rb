RSpec.describe "FinancialAccount", :type => :model do
	it "is valid with valid attributes" do
		f_a = FinancialAccount.create(name: "ExampleBank checking", financial_type: "Cash")
		expect(f_a).to be_valid
	end
end