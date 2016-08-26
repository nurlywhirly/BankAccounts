require 'csv'
require_relative 'account.rb'

module Bank
  class MoneyMarketAccount < Account
    attr_accessor :initialize, :withdraw, :deposit, :balance, :id, :withdraw_using_check, :check_count, :withdrawal_fee

    MINIMUM_AMOUNT = 10000
    WITHDRAWAL_FEE = 0

    def initialize(id,balance)
      @transaction_count = 1
      @overdraft_fee = 100
      super
    end

    def withdraw(amount)
      new_balance =  @balance - amount - self.class::WITHDRAWAL_FEE
      if new_balance > self.class::MINIMUM_AMOUNT
        @balance = new_balance
        puts "You have withdrawn $#{ amount }. Your new balance is $#{ @balance }."
        return @balance
      else
        @balance = new_balance - @overdraft_fee
        puts "You have gone under the minimum amount of #{ self.class::MINIMUM_AMOUNT }. You have been charged an overdraft fee of $#{ @overdraft_fee }."
          until @balance >= self.class::MINIMUM_AMOUNT
            puts "Please deposit more before doing anything else."
          end
      end
    end

    def deposit(amount)
      super
    end

    def add_interest(rate)
      interest_money_earned = @balance * (rate / 100)
      @balance = @balance + interest_money_earned.round(2)
      puts "You earned #{ interest_money_earned.round(2) }. You're new balance is #{ @balance }."
      return interest_money_earned.round(2)
    end

    def current_balance
      super
    end

  end
end

account = Bank::MoneyMarketAccount.new(123,2000,"today")

account.withdraw_using_check(1)
account.withdraw_using_check(1)
account.withdraw_using_check(1)
account.withdraw_using_check(1)

puts "#{account.check_count}  #{account.balance}"
