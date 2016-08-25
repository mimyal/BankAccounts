require_relative 'bank_account'
require_relative 'bank_account_svs'
#require_relative 'test_banksvs'

Bank::Account.all
#puts "1"
my_account = Bank::Account.find("1212")
#puts my_account # shows the instance of Account
#puts '2'
my_account.display_balance
#puts '3'
my_account.deposit(5000)
#puts '4'
my_account.withdraw(3400)
puts '5'
my_savings = Bank::SavingsAccount.new("12345abc", 1000000, "1-jan-2016")
puts '6'
my_savings.display_balance # @TODO shows an object
# @TODO puts "If we paid any interest your balance would be: " + my_savings.add_interest(0.25).round(2).to_s
my_savings.deposit(400)
my_savings.withdraw(400)
# my_savings.withdraw(10000-90)
