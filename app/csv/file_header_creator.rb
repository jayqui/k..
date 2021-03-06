class CSV::FileHeaderCreator
  include Procto.call

  def initialize(destination_directory:)
    @destination_directory = destination_directory
  end

  def call
    create_csv_file_header!
  end

  private

  attr_reader :destination_directory
  alias_method :dirname, :destination_directory

  def create_csv_file_header!
    CSV.open(filename, "w", headers: true) do |csv|
      csv << [
        "priority",
        "username",
        "name",
        "last messaged",
        "match %",
        "basics",
        "ft.",
        "in.",
        "body",
        "age",
        "city",
        "last online",
        "has kids",
        "wants kids",
        "lifestyle",
        "background",
        "description"
     ]
    end
  end

  def filename
    "#{dirname}/#{Constants::FILE_AND_FOLDER_NAME}.csv"
  end
end
