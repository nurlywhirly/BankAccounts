require_relative 'account.rb'
require_relative 'AccountHolder.rb'

my_account = Bank::Account.new("NAMEY",100)

my_account.withdraw(300)
