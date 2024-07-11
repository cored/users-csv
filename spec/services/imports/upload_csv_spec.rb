require 'rails_helper'

RSpec.describe Imports::UploadCsv do
  subject(:upload_csv) { described_class.new(csv_data: csv_data, user_repo: user_repo) }
  let(:csv_data) { [ { "name" => "John Doe", "password" => "iVali191828328181" } ] }
  let(:user_repo) { class_double(User, create: user).as_stubbed_const }

  describe "#call" do

    context "when the CSV is valid" do
      let(:user) { instance_double(User, valid?: true) }

      it "creates a new user" do
        upload_csv.call

        expect(user_repo).to have_received(:create).with(name: "John Doe", password: "iVali191828328181")

      end

      it "returns a success result" do
        result = upload_csv.call

        expect(result).to eq([Imports::UploadCsv::Result.success(name: "John Doe", password: "iVali191828328181")])
      end
    end

    context "when the CSV is invalid" do
      let(:user) { instance_double(User, valid?: false) }

      it "returns a failure result" do
        result = upload_csv.call

        expect(result).to eq([Imports::UploadCsv::Result.failure(name: "John Doe", password: "iVali191828328181")])
      end
    end

  end
end
