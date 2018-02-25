require 'byebug'
class ApplicationController < ActionController::API
	include Response
	include ExceptionHandler

	before_action :authorize_request
	attr_reader :current_user, :current_student

	private

	def authorize_request
		@current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
		#@current_student = (AuthorizeApiRequest.new(request.headers).call_student)[:student]
	end
end
