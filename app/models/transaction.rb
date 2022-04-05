class Transaction < ApplicationRecord
	attr_accessor :ident, :desc, :unixTime, :amountCents

end