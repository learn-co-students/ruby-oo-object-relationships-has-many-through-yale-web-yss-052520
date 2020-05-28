# We set up the Meal class as a "joining" model between our Waiter and Customer classes
class Meal
    attr_accessor :waiter, :customer, :total, :tip

    @@all = []

    def initialize(waiter, customer, total, tip=0)
        @waiter = waiter
        @customer = customer
        @total = total
        @tip = tip
        @@all << self
    end

    def self.all 
        @@all
    end 
end