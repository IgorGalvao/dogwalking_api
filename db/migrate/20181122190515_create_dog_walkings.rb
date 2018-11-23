class CreateDogWalkings < ActiveRecord::Migration
  def change
    create_table :dog_walkings do |t|
      t.integer :status
      t.date    :booked_date
      t.integer :pricing
      t.integer :duration
      t.float   :latitude
      t.float   :longitude
      t.integer :pets
      t.time    :start_time
      t.time    :end_time

      t.timestamps null: false
    end
  end
end
