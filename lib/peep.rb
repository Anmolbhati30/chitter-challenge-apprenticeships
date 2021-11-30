require "pg"

class Peep
  def self.all
    result = connection.exec(
      "SELECT * FROM peeps;"
    )

    result.map { |peep|
      Peep.new(id: peep["id"], message: peep["message"])
    }
  end

  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  private

  def self.connection
    connection_point = ENV["ENVIRONMENT"] == "test" ? "chitter_test" : "chitter"
    return PG.connect(dbname: connection_point)
  end
end
