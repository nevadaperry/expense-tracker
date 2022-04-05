class HistoryEntry < ApplicationRecord
	attr_accessor :ident, :unixTime, :className, :method, :args
end