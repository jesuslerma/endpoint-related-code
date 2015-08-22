class Api::V3::EmpresasController < Api::V3::BaseController
	def index
		empresas = Empresa.search params
		render json: empresas, status: :ok, root: :companies
	end
	def show
		empresa = Empresa.find params[:id]
		render json: empresa, status: :ok, root: :company
	end
	def update
		empresa = Empresa.find params[:id]
		empresa.update_attributes(params[:company])
		render json: empresa, status: :ok, root: :company
	end
end