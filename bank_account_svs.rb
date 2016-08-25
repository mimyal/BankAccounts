require_relative 'bank_account'
module Bank
  class SavingsAccount < Account
    attr_accessor :id, :balance
    def initialize(id,balance,start_date)
      savings = balance
      super(id,balance,start_date)
      balance = savings
      if @balance < 10
        raise ArgumentError, "Savings accounts cannot open with less than ten independent coins."
      end

    end
    # @todo super changes @balance and returns it, but it does not know that we imposed a minimum_balance
    def withdraw(withdrawal_amount)
      balance = @balance
      puts balance
      fee = 2.00
      #minimum_balance = 10.00
      transaction = withdrawal_amount + fee #+ minimum_balance + fee
      balance = super(transaction) # + minimum_balance
      puts balance
      #return @balance
    end#withdraw

  #@todo does not work?
    def add_interest(rate)
      balance_with_interest = @balance * (rate / 100)
      return balance_with_interest
    end
  end
end
