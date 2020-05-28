class Waiter
    attr_reader :name, :experience
    @@all = []

    def initialize(name, exp)
        @name = name
        @experience = exp
        save()
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals()
        Meal.all().select {|meal| meal.waiter == self}
    end

    def best_tipper()
        meals.max_by {|meal| meal.tip}.customer
    end

    def save()
        self.class.all() << self
    end 

    def self.all()
        @@all
    end
end