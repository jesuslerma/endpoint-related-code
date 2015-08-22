require 'rails_helper'

RSpec.describe Empresa, :type => :model do
	describe "class methods" do
		describe ".search" do
			before do
				@despacho = FactoryGirl.create(:despacho)
				FactoryGirl.create(:empresa, despacho_id: @despacho.id)
				FactoryGirl.create(:empresa_megaprestaciones, despacho_id: @despacho.id)
			end
			context "when no params are present" do
				it "returns all records" do
					expect(Empresa.search.count).to eq Empresa.all.count
				end
			end
			context "when despacho_id param is present" do
				let(:params) { {despacho_id: @despacho.id}  }
				it "returns two records records" do
					expect(Empresa.search(params).count).to eq 2
				end
			end
			context "when rfc param is present" do
				let(:params) {{ rfc: "TEG080425R58" }}
				it "returns one record" do
					expect(Empresa.search(params).count).to eq 1
				end
			end
			context "when name param is present" do
				let(:params) {{ name: "TEGIK"}}
				it "returns one record" do
					expect(Empresa.search(params).count).to eq 1
				end
			end
			context "where active is present" do
				let(:params) {{ active: true }}
				it "returns two records" do
					expect(Empresa.search(params).count).to eq 2
				end
			end
		end
	end
end
