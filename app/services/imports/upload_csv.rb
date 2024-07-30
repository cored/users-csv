require "csv"

module Imports

  InvalidCsv = Class.new(StandardError)
  class UploadCsv
    def self.call(file)
      csv_data = CSV.read(file.path, headers: true)
      new(csv_data: csv_data).call
    rescue CSV::MalformedCSVError => e
      raise InvalidCsv.new(e.message)
    end

    def initialize(csv_data:, user_repo: User)
      @csv_data = csv_data
      @user_repo = user_repo
    end

    def call
      validate_csv_data

    end

    private

    def validate_csv_data
      process_csv_data.map do |user_attrs|
        user_repo.create(user_attrs)
      end
    end

    def process_csv_data
      @processed_csv_data ||= csv_data.map do |row|
        { name: row["name"].strip, password: row["password"].strip }
      end
    end

    attr_reader :csv_data, :user_repo
  end
end
