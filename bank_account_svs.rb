# This is the file for subclasses of Bank::Account
require_relative 'bank_account'
module Bank
  class SavingsAccount < Account
    MINIMUM_BALANCE = 10.00
    attr_accessor :id, :balance
    def initialize(id,balance,start_date)
      super(id,balance,start_date)
      if @balance < 10
        raise ArgumentError, "Savings accounts cannot open with less than ten independent coins."
      end
    end
    def withdraw(withdrawal_amount)
      fee = 2.00
      transaction = withdrawal_amount + fee
      super(transaction)
      puts "Your savings account balance is #{ sprintf("%0.02f", @balance) } independent coins." # For testing
      return @balance
    end#withdraw
    def add_interest(rate)
      balance_with_interest = @balance + @balance * (rate / 100)
      return balance_with_interest
    end
  end
  class CheckingAccount < Account
    MINIMUM_BALANCE = 0
    attr_accessor :checks
    # ####### @todo attr_accessor ? Seems to work without ######
    def initialize(id,balance,start_date)
      super(id,balance,start_date)
      @checks = 0
    end
    def withdraw(withdrawal_amount)
      fee = 1.00
      transaction = withdrawal_amount + fee
      super(transaction)
      puts "Your checking account balance is #{ sprintf("%0.02f", @balance) } independent coins." # For testing
      return @balance
    end
    def withdraw_using_check(amount)
      checks = @checks + 1
      if checks <= 3
        fee = 0
      else # if checks > 3
        puts "You have passed the limit of free checks this month."
        fee = 2
      end
      new_balance = @balance - (amount + fee)
      if new_balance > -10
        @balance = new_balance
        @checks +=1
        if fee == 2
          puts "This transaction added a fee of two independent coins."
        end
      else
        puts "This is more money than you are allowed to withdraw. "
        puts "Your check was returned from the bank."
      end
      return @balance
    end
    def reset_checks
      @checks = 0
    end
  end
end
