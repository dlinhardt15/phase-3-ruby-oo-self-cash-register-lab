require "pry"

class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction

    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = last_transaction
        # binding.pry
    end
    
    def add_item (title, price, quantity = 1)
        self.total += price * quantity
        # binding.pry
        quantity.times do @items.push(title)
        end
        @last_transaction = [title, price, quantity]
        # binding.pry
    end

    def apply_discount
        if discount > 0
            self.total = self.total - self.total * discount / 100
            "After the discount, the total comes to $#{self.total}."
        else "There is no discount to apply."
        end
    end
    
    def void_last_transaction
        @items.pop
        @items == [] ? self.total = 0.0 : self.total -= @last_transaction[1] * @last_transaction[2]
    end

end