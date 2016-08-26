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
#puts '5'
small_savings = Bank::SavingsAccount.new("12345abc", 2000, "1-jan-2016") # $20
small_savings.display_balance
small_savings.withdraw(15)
#puts '5.1'
my_savings = Bank::SavingsAccount.new("12345abc", 1000000, "1-jan-2016")
#puts '6'
my_savings.display_balance
print "If we paid any interest your balance would be: "
puts my_savings.add_interest(0.25).round(2).to_s
my_savings.deposit(400)
my_savings.withdraw(400)
my_check_acct = Bank::CheckingAccount.new("12345abc", 1000000, "1-jan-2016")
#puts '7'
my_check_acct.display_balance
my_check_acct.withdraw(400)
puts "A second checking account!? Here you go!"
my_check_acct = Bank::CheckingAccount.new("12345abc", 10000, "1-jan-2016")
my_check_acct.withdraw_using_check(10)
my_check_acct.display_balance
my_check_acct.withdraw_using_check(10)
my_check_acct.display_balance
my_check_acct.withdraw_using_check(10)
my_check_acct.display_balance
my_check_acct.withdraw_using_check(10)
my_check_acct.display_balance
my_check_acct.withdraw_using_check(60)
my_check_acct.display_balance
puts "Here is your new account!"
my_check_acct = Bank::CheckingAccount.new("12345abc", 10000, "1-jan-2016")
my_check_acct.withdraw_using_check(110)
my_check_acct.display_balance
puts "Let's try the check reset by writing three checks!"
my_check_acct = Bank::CheckingAccount.new("12345abc", 10000, "1-jan-2016")
my_check_acct.withdraw_using_check(10)
my_check_acct.display_balance
my_check_acct.withdraw_using_check(10)
my_check_acct.display_balance
my_check_acct.withdraw_using_check(10)
my_check_acct.display_balance
my_check_acct.withdraw_using_check(10)
puts "Here is your fee!"
my_check_acct.reset_checks rescue puts "ERROR! Writing the method right now."
my_check_acct.display_balance
my_check_acct.withdraw_using_check(10)
my_check_acct.display_balance
