# Requirements
# 1) Create a Bank module which will contain your Account class and any future bank account logic.
# 2) Create an Account class which should have the following functionality:
#   - Should have a withdraw method that accepts a single parameter which represents the
#     amount of money that will be withdrawn. This method should return the updated account balance.
#   - Should have a deposit method that accepts a single parameter which represents the amount of
#     money that will be deposited. This method should return the updated account balance.
#   - Should be able to access the current balance of an account at any time.
module BankingServices
  class BankAccount # class for each account
    attr_accessor :account_data # different gets and sets

    def initialize
      @account_data = {
        id:       "abc12345",
        balance:  0 # currency
      }

      if @account_data[:balance] < 0
        raise ArgumentError, "Accounts cannot initialize with a negative balance"
      end

    end #init

    def withdraw_from_account(withdrawal_amount)
      new_balance = @account_data[:balance] - withdrawal_amount
      if new_balance > 0
        @account_data[:balance] = new_balance
      else
        puts "This is more money than this account holds."
      end
    end#withdraw

    def deposit_to_account(deposit_amount)
      @account_data[:balance] = @account_data[:balance] + deposit_amount
      puts current_balance # @todo start here for nice output to user
    end #deposit

    def current_balance
      return @account_data[:balance]
    end #balance
  end #BankAccounts


end #modBankingServices
