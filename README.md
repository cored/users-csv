# User Data Upload Application

This application allows users to upload a CSV file containing user data. Each user entry in the CSV file is validated against specific criteria before being saved to the database.

## Technologies Used

- [Ruby on Rails](https://rubyonrails.org/) - A web application framework written in Ruby.
- [RSpec](https://rspec.info/) - A testing framework for Ruby.
- [CSV](https://ruby-doc.org/stdlib-2.7.4/libdoc/csv/rdoc/CSV.html) - Ruby's built-in library for reading and writing CSV files.
- [FactoryBot](https://github.com/thoughtbot/factory_bot) - A library for setting up Ruby objects as test data.
- [Turbo Streams](https://turbo.hotwired.dev/) - Used for updating HTML pages in real-time.

## Problem Statement

The application's main goal is to handle CSV uploads containing user data. Each user record must include a `name` and a `password` that meets specific criteria to be considered valid:
- The `name` attribute is required.
- The `password` attribute must:
	- Be between 10 and 16 characters long.
	- Include at least one lowercase letter, one uppercase letter, and one digit.
	- Not contain three repeating characters in a row.

Upon uploading a CSV file, the application processes each row, attempts to create a user record, and displays the result (success or failure) for each row.

## Implementation Structure

The application is structured as follows:

- **Controllers**:
	- `UsersController`: Handles CSV file uploads and displays results.

- **Models**:
	- `User`: Represents a user with validations for `name` and `password`.

- **Services**:
	- `Imports::UploadCsv`: Responsible for parsing and validating CSV data, creating `User` records, and handling exceptions for invalid CSV files.

- **Views**:
	- Minimal views are used, primarily to display results after CSV upload.

## How to Run Tests

To run tests for the application:

1. **Install Dependencies**: Make sure all dependencies specified in the `Gemfile` are installed by running:
	 ```bash
	 bundle install
	 ```

2. **Run RSpec Tests**: Execute the following command to run the RSpec tests located in the `spec` directory:
	 ```bash
	 rspec
	 ```
	 This command will run all tests and display the results in your terminal.

## How to Run and Try the Application

To run and try out the application locally, follow these steps:

1. **Clone the Repository**: Clone the Git repository to your local machine:
	 ```bash
	 git clone <repository-url>
	 cd <repository-name>
	 ```

2. **Install Dependencies**: Install all dependencies specified in the `Gemfile`:
	 ```bash
	 bundle install
	 ```

3. **Setup Database**: If necessary, setup your database with:
	 ```bash
	 rails db:create
	 rails db:migrate
	 ```

4. **Start the Rails Server**: Start the Rails server to run the application locally:
	 ```bash
	 rails server
	 ```

5. **Access the Application**: Open your web browser and navigate to `http://localhost:3000` to access the application.

6. **Upload CSV File**: On the homepage, you can upload a CSV file containing user data following the specified format.

7. **View Results**: After uploading the CSV file, the application will display the results (success or failure) for each row processed.

## Contributing

Contributions are welcome! Feel free to fork the repository, create pull requests, and suggest improvements.

## License

This project is licensed under the [MIT License](LICENSE).
