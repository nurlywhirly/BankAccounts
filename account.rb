module Bank
  class Account
    attr_accessor :initialize, :withdraw, :deposit, :balance, :id_creation, :owner_info
    attr_reader :id

    def initialize(name, balance)
      @balance = balance
        if @balance < 0.01
          raise ArgumentError
        end
      @owner_info = Bank::AccountHolder.new(name)
      puts "Thank you, #{ owner_info.name } for creating a new account with us. Your ID number is #{ owner_info.id } and your balance is $#{ @balance }"
    end

    def withdraw(amount)
      new_balance =  @balance - amount
      if new_balance > 0.01
        return @balance = new_balance
      else
        raise Exception.new("You do not have enough funds to withdraw #{ amount }. Your balance is $#{ @balance }.")
        return @balance
      end
    end

    def deposit(amount)
      @balance = @balance + amount
      puts "Your new balance is $#{ @balance }."
      return @balance
    end

    def balance
      puts "Your balance is $#{ @balance }"
      return @balance
    end

  end
end
