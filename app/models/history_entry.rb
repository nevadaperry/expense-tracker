class HistoryEntry < ApplicationRecord
	attr_accessor :id, :unix_time, :class_name, :method, :args
end