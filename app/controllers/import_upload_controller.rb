class ImportUploadController < ApplicationController
	def index
		@users = User.all
	end

	def create
		redirect_to import_upload_index_path, alert: "No file uploaded. Please upload a CSV file." and return if uploaded_file.blank?

		@users = Imports::UploadCsv.call(uploaded_file)

		respond_to do |format|
			format.html { redirect_to import_upload_index_path, notice: "CSV file uploaded successfully." }
			format.turbo_stream
		end

	rescue Imports::InvalidCsv => e
		redirect_to import_upload_index_path, error: "Invalid CSV format: #{e.message}"
	end

	private

	def uploaded_file
		params[:file]
	end

end
