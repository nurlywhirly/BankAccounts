require_relative 'account.rb'
require_relative 'Owner.rb'

my_account = Bank::Account.new("John Johnson",100)

my_account.withdraw(50)
my_account.deposit(1)
my_account.balance
