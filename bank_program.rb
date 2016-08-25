require_relative 'bank_account'
#require_relative 'test_banksvs'

Bank::Account.all
#puts "1"
my_account = Bank::Account.find("1212")
#puts '2'
my_account.display_balance
#puts '3' 
my_account.deposit(5000)
#puts '4'
my_account.withdraw(3400)
