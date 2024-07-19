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

		click_button 'Upload CSV'

		expect(page).to have_content 'No file uploaded. Please upload a CSV file.'
	end

	scenario 'User uploads an invalid CSV file' do
		visit import_upload_index_path

		# Attach a non-CSV file for upload (if necessary)
		attach_file 'file', Rails.root.join('spec', 'fixtures', 'invalid_file.txt')

		click_button 'Upload CSV'

		expect(page).to have_content 'Invalid CSV format'
		expect(current_path).to eq import_upload_index_path
	end
end
