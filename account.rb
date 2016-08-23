module Bank
  class Account
    attr_accessor :initialize, :withdraw, :deposit, :balance, :id_creation, :name
    attr_reader :id

    def initialize(balance)
      @id = rand(100000..999999)    #later on, set =@id_creation
      @balance = balance
        if @balance < 0.01
          raise ArgumentError
        end
      puts "Thank you for creating a new account with us. Your ID number is #{ @id } and your balance is $#{ @balance }"
    end

    # def id_creation       #might need later for more complex ID creation
    #   return rand(100000..999999)
    # end

    def withdraw(amount)
      @balance =  @balance - amount
      if @balance > 0.01
        return @balance
      else
        raise Exception.new("You do not have enough funds to withdraw #{ amount }. Your balance is #{ @balance }.")
        return @balance
      end
    end

    def deposit(amount)
      @balance = @balance + amount
      puts "Your new balance is $#{ @balance }."
      return @balance
    end

    def balance
      puts "Your balance is #{ @balance }"
      return @balance
    end

  end
end
