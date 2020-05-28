class Customer
    attr_accessor :name, :age
    @@all = []
    def initialize(name, age)
        @name = name
        @age = age
        @@all << self 
    end 

    def self.all
        @@all 
    end 

    # Custom Constructor - allows us to create new meals as a customer
    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end
    
    # Look at all meals and select only the one's belonging to this customer(self)
    def meals
        Meal.all.select do |meal|
            meal.customer == self
        end 
    end
    
    # Get all the waiters this customer has interacted with by using the array of all their meals
    def waiters
        self.meals.map {|meal| meal.waiter}
    end 
end