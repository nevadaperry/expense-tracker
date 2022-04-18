class HomeController < ApplicationController
	def index
	end

	def self.get_balance(f_a_id)
		return Transaction.where(account_in: f_a_id).sum(:amount_cents) / 100.0
	end
	
	def self.get_net_balance
		f_a_joins = FinancialAccount.joins("LEFT OUTER JOIN transactions ON
								transactions.account_in = financial_accounts.id")
		net_balance = f_a_joins.where(financial_type: "Cash")
											.sum(:amount_cents) / 100.0
		net_balance -= f_a_joins.where(financial_type: "Expense")
											.sum(:amount_cents) / 100.0
		net_balance += f_a_joins.where(financial_type: "Long-term")
											.sum(:amount_cents) / 100.0
		return net_balance
	end
	
	def self.get_liquid_balance
		f_a_joins = FinancialAccount.joins("LEFT OUTER JOIN transactions ON
								transactions.account_in = financial_accounts.id")
		net_balance = f_a_joins.where(financial_type: "Cash")
											.sum(:amount_cents) / 100.0
		net_balance -= f_a_joins.where(financial_type: "Expense")
											.sum(:amount_cents) / 100.0
		return net_balance
	end

	def self.get_resulting_balance(f_a_id, tx)
		return Transaction.where(account_in: f_a_id,
						unix_time: ..tx.unix_time).sum(:amount_cents) / 100.0
	end
	
	def f_a_create
		name = params[:name].presence || "Default name"
		FinancialAccount.create(name: name,
								financial_type: params[:financial_type])
		redirect_to "/?pane=manage_accounts"
	end
	
	def f_a_update
		FinancialAccount.find_by(id: params[:f_a_id]).update(
			name: params[:name], financial_type: params[:financial_type])
		redirect_to "/?pane=manage_accounts&just_updated=" + params[:f_a_id]
	end
	
	def f_a_delete
		FinancialAccount.destroy_by(id: params[:f_a_id])
		redirect_to "/?pane=manage_accounts"
	end

	def tx_create
		desc = params[:desc].presence || "Default description"
		amount_cents = (params[:amount].to_f * 100).to_i
		date_string = params[:date_string]
		unix_time = Time.strptime(date_string, "%m/%d/%Y %H:%M").to_i
		Transaction.create(desc: desc,
						amount_cents: amount_cents,
						unix_time: unix_time,
						account_in: params[:account_in])
		redirect_to "/?pane=account_contents&account=" + params[:account_in]
	end

	def tx_delete
		Transaction.destroy_by(id: params[:tx_id])
		redirect_to "/?pane=account_contents&account=" + params[:account_in]
	end
end