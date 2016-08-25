require 'csv'

module Bank
  class Owner
    attr_accessor :id, :last_name, :first_name, :street, :city, :state

    def initialize(id, last_name, first_name, street, city, state)
      @id = id
      @last_name = last_name
      @first_name = first_name
      @street = street
      @city = city
      @state = state
    end

    def self.all
      all_owners = {}
      CSV.read("/Users/nurl/ada/homework/BankAccounts/support/owners.csv").each do |line|
        all_owners[line[0]] = self.new(line[0],line[1],line[2],line[3],line[4],line[5])
      end
      return all_owners
    end

    def self.find(id)
      all_owners = self.all

      if all_owners.key?(id)
        return all_owners[id]
      else
        raise Exception.new("We do not have an account with that ID number.")
      end
    end

  end
end

o = Bank::Owner.find("15")

puts "#{o.last_name}"
