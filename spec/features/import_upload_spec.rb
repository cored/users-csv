require 'rails_helper'

RSpec.feature 'ImportUpload', type: :feature do
	scenario 'User uploads a valid CSV file' do
		visit import_upload_index_path

		# Attach a sample CSV file for upload
		attach_file 'file', Rails.root.join('spec', 'fixtures', 'files', 'users.csv')

		click_button 'Upload'

		expect(page).to have_content 'CSV file uploaded successfully.'
	end

	scenario 'User uploads no file' do
		visit import_upload_index_path

		click_button 'Upload'

		expect(page).to have_content 'No file uploaded. Please upload a CSV file.'
	end
end
