require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe "POST #create" do
		context "with valid file upload" do
			let(:valid_csv) { fixture_file_upload('users.csv', 'text/csv') } # Example CSV file in `spec/fixtures/files/users.csv`

			it "uploads CSV file and redirects to users path" do
				post :create, params: { file: valid_csv }

				expect(flash[:success]).to eq("CSV file uploaded successfully.")
				expect(response).to redirect_to(users_path)
			end
		end

		context "with invalid file upload" do
			it "handles invalid CSV file and redirects back to new user path" do
				post :create, params: { file: nil }

				expect(flash[:alert]).to eq("No file uploaded. Please upload a CSV file.")
				expect(response).to redirect_to(users_path)
			end
		end
	end
end
