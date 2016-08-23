module Bank
  class AccountHolder
    attr_accessor :name, :id

    def initialize(name)
      @name = name
      @id = rand(100000..999999)
    end

    def id
      return @id
    end

    def name
      return @name
    end
    
  end
end
