# Goal:
# Add items of varying Quantities and Prices
# Calculate Discounts
# Keep Track of what's been added to it
# Void the last transaction

require 'pry'

class CashRegister

    attr_accessor :discount, :total, :items, :last_item_price
     
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        # We need to be able to access items in any instance methods in this class. So we need an instance variable defined here. And since its going to be an array, we set it equal to an empty array
        @items = []
    end

    def add_item(title, price, qty = 1)
          # There is a way to set and get the total price. instead of writing @total += price, we can use the method .self to call the methods read at attr_accesor into this instance method.
          self.last_item_price = price * qty
          self.total += self.last_item_price
          qty.times do 
            self.items << title
          end
    end

    def apply_discount
        if self.discount != 0
            discount_price = discount/100.0 * total
            self.total = total - discount_price
            "After the discount, the total comes to $#{total.round()}."
        else
            "There is no discount to apply."
        end
    end

    # I need to find a way to keep track of the last item and its price..
    def void_last_transaction
        self.total -= self.last_item_price
    end



end

cr1 = CashRegister.new

binding.pry
