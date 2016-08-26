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
  class MoneyMarketAccount < Account
    MINIMUM_BALANCE = 10000
    TRANSACTIONS_MAX = 6
    attr_accessor :balance, :transactions, :suspend_account # @TODO this class need to access and change it, is this why?
    def initialize(id, balance, start_date)
      super(id, balance, start_date)
      @transactions = 0
      @suspend_account = false
      if @balance < 10000
        raise ArgumentError, "Money market accounts cannot open with less than ten thousand independent coins."
      end
    end
    # @TODO rewrite these if loops to case statements
    def withdraw(withdrawal_amount)
      fee = 100
      if @transactions >= TRANSACTIONS_MAX
        puts "You have passed the limit of transactions this month."
        puts "No more transactions allowed."
        return @balance # jumps out of method
      end
      if @suspend_account == true
        puts "Your account is suspended. Deposit some money."
        return @balance
      end
      new_balance = @balance - withdrawal_amount
      if new_balance > 10000
        @balance = new_balance
        @transactions += 1
      else
        if (fee...10000).include?(new_balance)
          puts "Your account balance is now below the minimum balance, #{ MINIMUM_BALANCE} independent coins. "
          puts "A fee, #{ fee } independent coins,for this transaction has occurred and your account is suspended. "
          puts "Deposit money to continue using our services."
          @balance = new_balance - fee
          @transactions += 1
          @suspend_account = true
        else # if new_balance negative
          puts "This is more money than you are allowed to withdraw. Transaction cancelled."
        end
      end
      return @balance
    end
    def deposit(deposit_amount)
      new_balance = @balance + deposit_amount
      if new_balance >= 10000
        @suspend_account = false
        @balance = new_balance
        puts "Thank you for your deposit. Your account is unsuspended."
        return @balance
      end
      @transactions += 1
      super(deposit_amount)
    end
    # def add_interest(rate)
    def reset_transactions
      @transactions = 0
    end
  end
end
