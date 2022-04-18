Rails.application.routes.draw do
	root "home#index"
	post "/f_a_create", to: "home#f_a_create"
	post "/f_a_update", to: "home#f_a_update"
	post "/f_a_delete", to: "home#f_a_delete"
	post "/tx_create", to: "home#tx_create"
	post "/tx_delete", to: "home#tx_delete"
end