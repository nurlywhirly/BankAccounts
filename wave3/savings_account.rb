require 'csv'
require_relative 'account.rb'

module Bank
  class SavingsAccount < Account
    attr_accessor :initialize, :withdraw, :deposit, :balance, :id, :add_interest

    def initialize(id,balance,open_date)
      super
      @minimum_amount = 10
      @withdrawal_fee = 2
    end

    def self.all
      super
    end

    def self.find(id)
      super
    end

    def withdraw(amount)
      super(amount)
    end

    def add_interest(rate)
      interest_money_earned = @balance * (rate / 100)
      @balance = @balance + interest_money_earned.round(2)
      puts "You earned #{ interest_money_earned.round(2) }. You're new balance is #{ @balance }."
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

account = Bank::SavingsAccount.new(123,20000,"today")

account.withdraw(20)
account.withdraw(20)
account.withdraw(20)
account.add_interest(0.30)

puts "$#{account.balance}"
