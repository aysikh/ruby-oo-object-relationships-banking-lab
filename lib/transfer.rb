require 'pry'

class Transfer
  attr_accessor :amount, :sender, :receiver, :status

  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.valid? == true && sender.balance >= amount 
      until self.status == "complete"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
      end
      # binding.pry
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end


end
