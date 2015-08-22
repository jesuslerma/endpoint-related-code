require 'rails_helper'

RSpec.describe Api::V3::EmpresasController, :type => :controller do
	describe "GET #index" do
		before(:each) do
			FactoryGirl.create :empresa
			FactoryGirl.create :empresa_megaprestaciones
			get :index
		end
		it "renders empresas array" do
			expect(json_response[:companies]).to have(2).items
		end
		it "renders despacho information" do
			expect(json_response[:companies].first).to have_key(:despacho_id)
		end
	end
	describe "GET #show" do
		before(:each) do
			@empresa = FactoryGirl.create :empresa
			get :show, id: @empresa.id
		end
		it "returns a single record" do
			expect(json_response[:company][:id]).to eq(@empresa.id)
		end
	end
	describe "PUT/PATCH #update" do
		before(:each) do
			@empresa = FactoryGirl.create :empresa
			put :update, {id: @empresa, company: {name: "TEGIK Company"}}
		end
		it "updates the company name" do 
			expect(json_response[:company][:name]).to eq "TEGIK Company"
		end
	end
end