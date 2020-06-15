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

    def new_meal(customer, total, tip=0)
        Meal.new(customer, self, total, tip)
    end

    def meals
        Meal.all.select{ |meal| meal.customer == self}
    end

    def waiters
        meals.map{ |meal| meal.waiter}
    end
   
  end