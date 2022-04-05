class FinancialAccount < ApplicationRecord
	has_many :transaction
	attr_accessor :ident, :desc, :type
end