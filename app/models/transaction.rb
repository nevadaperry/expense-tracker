class Transaction < ApplicationRecord
	validates_presence_of :unix_time, :amount_cents, :desc, :account_in
	validate :matches_to_valid_financial_account
	private
		def matches_to_valid_financial_account
			unless FinancialAccount.find_by_id(account_in)
				errors.add(:transaction, "AccountIn " + account_in.to_s + " does not match an existing FinancialAccount ID in the database")
			end
		end
end