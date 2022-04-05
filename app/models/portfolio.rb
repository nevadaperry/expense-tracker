class Portfolio < ApplicationRecord
	has_many :financial_account
	has_many :history_entry
	attr_accessor :ident, :desc
end