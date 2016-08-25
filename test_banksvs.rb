require_relative 'bank_account'

module Bank
  # Tests are written to ensure the functionality returns what is expected.
  # 3) Error handling
  #   A new account cannot be created with initial negative balance - this will raise an ArgumentError (Google this)
  #   The withdraw method does not allow the account to go negative - Will output a warning message and return the original un-modified balance
  class BankSvsTests


    #Test to ensure the balance display correctly
    def test_initial_balance
      test_bank_account = Bank::Account.new
      if test_bank_account.account_data[:balance] == 0
        return "Test success: Initial balance Integrity confirmed."
      else
        return puts "Test fail: Integrity of the initial balance failed."
      end

    end

    # ############
    # Didn't test:
    # Test balance after changes too?
    # Test to ensure the withdraw returns a correct balance
    # Test to ensure the deposit returns a correct balance
    #Test that the withdrawal never results in a negative balance
    #Now this is different from a test in that this check in the account program where this is not allowed.

    #Test that the initial balance is negative only with an ArgumentError
    def test_initial_balance_not_negative
      test_bank_account = Bank::Account.new
      if test_bank_account.account_data[:balance] >= 0
        return "Test success: Account balance is initially at or over zero."
      else
        return puts "Test fail: Account balance below zero at start."
      end
    end
  end #tests

  my_tests = Bank::BankSvsTests.new
  puts my_tests.test_initial_balance
  puts my_tests.test_initial_balance_not_negative

end #Bank
