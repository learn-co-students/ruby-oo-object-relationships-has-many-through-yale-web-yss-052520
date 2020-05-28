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

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select{|meal| meal.waiter==self}
    end
    def best_tipper
        meals.reduce(nil) do |max_tip_meal, meal|
            if !max_tip_meal
                max_tip_meal=meal
            elsif meal.tip > max_tip_meal.tip
                max_tip_meal=meal
            end
            max_tip_meal
        end.customer
    end
        
  end