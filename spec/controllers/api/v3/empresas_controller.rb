require 'rails_helper'

RSpec.describe Api::V3::EmpresasController, :type => :controller do
	describe "GET #index" do
		before(:each) do
			FactoryGirl.create :empresa
			FactoryGirl.create :empresa_megaprestaciones
			get :index
		end
		it "renders empresas array" do
			expect(json_response[:empresas]).to have(2).items
		end
		it "renders despacho information" do
			expect(json_response[:empresas].first).to have_key(:despacho)
		end
	end
end