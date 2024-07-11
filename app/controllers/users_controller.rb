class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def create
		uploaded_file = params[:file]

		redirect_to users_path, alert: "No file uploaded. Please upload a CSV file." and return if uploaded_file.blank?

		@users = Imports::UploadCsv.call(uploaded_file)

		flash[:success] = "CSV file uploaded successfully."

		respond_to do |format|
			format.html { redirect_to users_path }
			format.turbo_stream
		end

	rescue Imports::InvalidCsv => e
		flash[:error] = e.message
		redirect_to users_path
	end

end
