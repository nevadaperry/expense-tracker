Rails.application.routes.draw do
	root "home#index"
	post "/:action", to: "home#:action"
end