class DogWalking < ActiveRecord::Base
    
  enum status: [:booked, :started, :finished]
  
  def calculate_pricing
    if self.duration == 30
      first_pet_price = 25.0
      additional_pet_price = 15.0
    else
      first_pet_price = 35.0
      additional_pet_price = 20.0
    end
    self.pricing = first_pet_price + (pets - 1) * additional_pet_price
  end
  
  def calculate_end_time
    self.end_time = self.start_time + self.duration.to_f * 60
  end
end
