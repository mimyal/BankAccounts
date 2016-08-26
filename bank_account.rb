require 'csv'
module Bank
  class Account # class for each account
    MINIMUM_BALANCE = 0
    attr_accessor :id, :balance, :start_date # different gets and sets

    def initialize(id, balance, date)
      @id = id
      @balance = (balance / 100) # in dollars
      @start_date = date

      if @balance < 0
        raise ArgumentError, "Accounts cannot initialize with a negative balance"
      end
    end #init

    # Method returns a collection of Account instances, representing all of the Accounts described in the CSV.
    def self.all
      accounts = {}
      CSV.read('support/accounts.csv').each do |line|
        account = self.new(line[0],line[1].to_f,line[2]) #these are the arguments fed into the class instance -don't confuse with an array
        accounts[account.id] = account
      end #each
      return accounts # returns a hash of the Account instances in csv-file, using the csv-id as key
    end

    # Method returns an instance of Account where the value of the id field in the CSV matches the passed parameter
    def self.find(id)
      accounts = self.all
      return accounts[id]
    end

    def display_balance
      puts "Your balance is: #{ sprintf("%0.02f", @balance) } independent coins." # for testing
      return @balance
    end #balance

    def deposit(deposit_amount)
      @balance += deposit_amount
      puts "Your current balance after your deposit is: #{ sprintf("%0.02f", @balance) } independent coins." # for testing
      return @balance
    end #deposit

    def withdraw(withdrawal_amount)
      new_balance = @balance - withdrawal_amount
      if new_balance > self.class::MINIMUM_BALANCE
        @balance = new_balance
      else
        puts "This is more money than you are allowed to withdraw."
      end
      return @balance
    end#withdraw

  end #Account


end #mod Bank
