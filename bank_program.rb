require_relative 'bank_account'
require_relative 'test_banksvs'

my_account = Bank::Account.new
my_account.balance
my_account.deposit(5000)
my_account.withdraw(3400)
