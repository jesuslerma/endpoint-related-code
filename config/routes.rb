require 'api_constraints'

Contalink::Application.routes.draw do
	namespace :api, defaults: {format: 'json'} do 
		namespace :v3 do 
      get "companies" => 'empresas#index'
      get "companies/:id" => 'empresas#show'
      put "companies/:id" => 'empresas#update'
    end
	end
end