class Api::V3::BaseController < ApplicationController
	protect_from_forgery with: :null_session
end