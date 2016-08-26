
require 'csv'

module Bank
  class Account
    attr_accessor :initialize, :withdraw, :deposit, :balance, :id, :minimum_amount, :initial_deposit_good

    MINIMUM_AMOUNT = 0.01
    WITHDRAWAL_FEE = 0

    def initialize(id,balance)
      @balance = balance
      if initial_deposit_good?
        @id = id
      else
        raise ArgumentError,"You need at least $#{ self.class::MINIMUM_AMOUNT } to open this kind of account."
      end
    end

    def initial_deposit_good?
      if @balance > self.class::MINIMUM_AMOUNT
        return true
      else
        return false
      end
    end

    def withdraw(amount)
      new_balance =  @balance - amount - self.class::WITHDRAWAL_FEE
      if new_balance > self.class::MINIMUM_AMOUNT
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

    def current_balance
      puts "Your current balance is $#{ @balance }"
      return @balance
    end

  end
end
#
# account = Bank::Account.new(1234,1)
# puts "last puts is here: #{account.id} $#{account.balance}"        # Pull info for account 1212
