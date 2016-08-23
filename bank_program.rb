require_relative 'bank_account'
require_relative 'test_banksvs'

my_account = BankingServices::BankAccount.new
puts "Your starting balance is: #{ my_account.current_balance } independent coins."
my_account.deposit_to_account(5000)
puts "Your current balance after your deposit is: #{ my_account.current_balance } independent coins."
my_account.withdraw_from_account(3400)
puts "Your current balance after your withdrawal: #{ my_account.current_balance } independent coins."
