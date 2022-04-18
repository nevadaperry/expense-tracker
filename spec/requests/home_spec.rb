require 'rails_helper'

RSpec.describe "HomeController", :type => :request do
	it "gets '/' successfully" do
		get "/"
		expect(response).to have_http_status(:ok)
	end
	it "renders home#index view" do
		get "/"
		expect(response).to render_template("index")
	end
end