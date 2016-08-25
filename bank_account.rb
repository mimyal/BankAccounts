# Wave 2 Requirements
#
# Update the Account class to be able to handle all of these fields from the CSV file used as input.
# For example, manually choose the data from the first line of the CSV file and ensure you can create a new instance of your Account using that data
# Add the following class methods to your existing Account class
# self.all - returns a collection of Account instances, representing all of the Accounts described in the CSV. See below for the CSV file specifications
# self.find(id) - returns an instance of Account where the value of the id field in the CSV matches the passed parameter

require 'csv'
module Bank
  class Account # class for each account
    attr_accessor :account_id, :balance, :start_date # different gets and sets

    def initialize(id, balance, date)
      @account_id = id
      @balance = balance
      @start_date = date

      if balance < 0
        raise ArgumentError, "Accounts cannot initialize with a negative balance"
      end
    end #init

    # Method returns a collection of Account instances, representing all of the Accounts described in the CSV.
    def self.all
      accounts = []
      # Here is my hash of three arrays. But I should have made a hash of accounts... Maybe...
      CSV.read('support/accounts.csv').each do |line|
        account = self.new(line[0],line[1].to_f,line[2])
        accounts << account
      end #each
      return accounts
    end

    # Method returns an instance of Account where the value of the id field in the CSV matches the passed parameter
    def self.find(id)
      accounts = all # array of arrays where the array elements in the large array are each account

        accounts.each do |account|
          if account.account_id == id
            return account
          end
        end #each


    end

    def withdraw(withdrawal_amount)
      new_balance = @account_data[:balance] - withdrawal_amount
      if new_balance > 0
        @account_data[:balance] = new_balance
        puts "Your current balance after your withdrawal: #{ @account_data[:balance] } independent coins."
      else
        puts "This is more money than this account holds."
      end
      return @account_data[:balance]
    end#withdraw

    def deposit(deposit_amount)
      @account_data[:balance] = @account_data[:balance] + deposit_amount
      puts "Your current balance after your deposit is: #{ @account_data[:balance] } independent coins."
      return @account_data[:balance]
    end #deposit

    def balance
      puts "Your starting balance is: #{ @account_data[:balance] } independent coins."
      return @account_data[:balance]
    end #balance
  end #Account


end #mod Bank
