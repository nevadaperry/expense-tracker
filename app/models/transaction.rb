class Transaction < ApplicationRecord
	attr_accessor :id, :desc, :unix_time, :amount_cents
end