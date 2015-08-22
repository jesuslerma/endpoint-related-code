class EmpresaSearcher
  def search(params)
    if [:rfc, :name, :active, :despacho_id, :sortBy].any? {|s| params.key? s}
      empresas = Empresa
      if params.has_key?(:rfc) && !params[:rfc].blank?
        empresas = search_by_rfc empresas, params[:rfc]
      end
      if params.has_key?(:name) && !params[:name].blank?
        empresas = search_by_name empresas, params[:name]
      end
      if params.has_key?(:active)
        empresas = search_by_active empresas
      end
      if params.has_key?(:despacho_id)
        empresas = search_by_despacho empresas, params[:despacho_id]
      end
      if params.has_key?(:sortBy)
        asc = true
        if params.has_key?(:sortAscending)
          asc = params[:sortAscending]
        end
        query = query_string(params[:sortBy], asc)
        empresas = sort empresas, query
      end
      return empresas
    else
      return Empresa.all
    end
  end
  def param_is_true?(string)
     ActiveRecord::ConnectionAdapters::Column::TRUE_VALUES.include?(string)
  end
  def query_string(sort_by, asc)
    query_string = "#{sort_by} asc"
    query_string = "#{sort_by} desc" if !param_is_true?(asc)
  end
  def sort(empresas, query)
    empresas.order(query)
  end
  def search_by_rfc(empresas, rfc)
    empresas.where("rfc LIKE ?", "%#{rfc}%")
  end
  def search_by_active(empresas)
    empresas.where("active = 't'")
  end
  def search_by_name(empresas,name)
    empresas.where("name LIKE ? ", "%#{name}%")
  end
  def search_by_despacho(empresas, despacho_id)
    empresas.where(despacho_id: despacho_id)
  end
end
class Empresa < ActiveRecord::Base
  ...
  def self.search(params = {})
    EmpresaSearcher.new.search(params)
  end
  ...
end
