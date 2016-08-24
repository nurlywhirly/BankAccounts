require 'csv'

module Bank
  class Account
    attr_accessor :initialize, :withdraw, :deposit, :balance, :id, :all, :find
    # attr_reader :id

    def initialize(id,balance,open_date)
      @id = id
      @balance = balance / 100
        if @balance < 0.01
          raise ArgumentError
        end
      @open_date = open_date
    end

    def self.all
      all_accounts = {}
      CSV.read("/Users/nurl/ada/homework/BankAccounts/support/accounts.csv").each do |line|
        all_accounts[line[0]] = self.new(line[0],(line[1].to_f),line[2])
      end
      return all_accounts
    end

    def self.find(id)
      all_accounts = self.all

      if all_accounts.key?(id)
        return all_accounts[id]
      else
        raise Exception.new("We do not have an account with that ID number.")
      end
    end

    def withdraw(amount)
      new_balance =  @balance - amount
      if new_balance > 0.01
        @balance = new_balance
        puts "You have withdrawn $#{ amount }. Your new balance is $#{ @balance }."
        return @balance
      else
        raise Exception.new("You do not have enough funds to withdraw $#{ amount }. Your balance is $#{ @balance }.")
        return @balance
      end
    end

    def deposit(amount)
      @balance = @balance + amount
      puts "Thank you for depositing $#{ amount }. Your new balance is $#{ @balance }."
      return @balance
    end

    def balance
      puts "Your current balance is $#{ @balance }"
      return @balance
    end

  end
end

account = Bank::Account.find("1212")
puts "last puts is here: #{account.id}#{account.balance}"        # Pull info for account 1212
