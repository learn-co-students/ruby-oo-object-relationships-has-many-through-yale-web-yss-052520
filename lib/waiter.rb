class Waiter
    attr_accessor :name, :yrs_experience
    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end 

    def self.all 
        @@all
    end 

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    # Method for a waiter to find all of the meals they have served. 
    def meals 
        Meal.all.select {|meal| meal.waiter == self}
    end 

    # Takes all the meals this waiter has served and finds the best tipped meal and subsequently returns the name of the customer that left that tip
    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
            meal_a.tip <=>  meal_b.tip
        end 
        best_tipped_meal.customer
    end 
end