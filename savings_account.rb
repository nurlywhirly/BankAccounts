require 'csv'
require_relative 'account.rb'

module Bank
  class SavingsAccount < Account
    attr_accessor :initialize, :withdraw, :deposit, :balance, :id, :add_interest, :minimum_amount

    MINIMUM_AMOUNT = 10
    WITHDRAWAL_FEE = 2

    def initialize(id,balance)
      super
    end

    def withdraw(amount)
      super
    end

    def add_interest(rate)
      interest_money_earned = @balance * (rate / 100)
      @balance = @balance + interest_money_earned.round(2)
      puts "You earned $#{ interest_money_earned.round(2) }. You're new balance is $#{ @balance }."
      return interest_money_earned.round(2)
    end

    def deposit(amount)
      super(amount)
    end

    def current_balance
      super
    end

  end
end

account = Bank::SavingsAccount.new(123,100000)

puts "$#{account.balance}"

account.withdraw(20)
account.withdraw(20)
account.withdraw(20)
account.add_interest(0.30)
