require "peep"

describe Peep do
  describe ".new" do
    it "Creates a new Peep object" do
      peep = Peep.new(id: 1, message: "Test peep!")

      expect(peep.id).to eq 1
      expect(peep.message).to eq "Test peep!"
    end
  end

  describe ".all" do
    it "Lists all peeps" do
      connection = PG.connect(dbname: "chitter_test")
      add_rows_to_test_database
      first_id = connection.exec("SELECT MIN(id) FROM peeps;")[0]["min"]

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq first_id
      expect(peeps.first.message).to eq "This is peep 1!"
    end
  end
end
