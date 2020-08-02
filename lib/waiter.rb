class Waiter
  attr_accessor :name, :experience

  @@all = []

  def initialize(name, experience)
    @name = name
    @experience = experience

    @@all << self
  end

  def self.all
    @@all
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def customers
    meals.map { |meal| meal.customer }
  end

  def best_tipper
    max_tip = 0
    max_tipper = nil
    self.meals.each { |meal|
      if meal.tip > max_tip
        max_tipper = meal.customer
        max_tip = meal.tip
      end
    }
    return max_tipper
  end
end
