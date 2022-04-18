class FinancialAccount < ApplicationRecord
	validates_presence_of :name, :financial_type
end