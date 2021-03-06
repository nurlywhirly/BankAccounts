require 'csv'
require_relative 'account.rb'

module Bank
  class CheckingAccount < Account
    attr_accessor :initialize, :withdraw, :deposit, :balance, :id, :withdraw_using_check, :check_count, :withdrawal_fee

    def initialize(id,balance,open_date)
      super
      @check_count = 1
      @check_withdrawal_fee = 2
      @withdrawal_fee = 1
      @check_minimum_balance = -10
    end

    def self.all
      super
    end

    def self.find(id)
      super
    end

    def withdraw(amount)
      super
    end

    def withdraw_using_check(amount)
      if @check_count <= 3
        new_balance =  @balance - amount
      else
        new_balance = @balance - amount - @check_withdrawal_fee
      end

      if new_balance > @check_minimum_balance
        @balance = new_balance
        @check_count += 1
        puts "You have withdrawn $#{ amount }. Your new balance is $#{ @balance }."
        return @balance
      else
        raise Exception.new("You do not have enough funds to withdraw $#{ amount }. Your balance is $#{ @balance }.")
        return @balance
      end
    end

    def reset_checks
      #time method goes here to trigger at the beginning of a new month
      return @check_count = 0
    end

    def deposit(amount)
      super
    end

    def current_balance
      super
    end

  end
end

account = Bank::CheckingAccount.new(123,2000,"today")

account.withdraw_using_check(1)
account.withdraw_using_check(1)
account.withdraw_using_check(1)
account.withdraw_using_check(1)

puts "#{account.check_count}  #{account.balance}"
