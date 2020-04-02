require 'minitest/autorun'
require 'minitest/pride'
require './lib/passenger'
require './lib/vehicle'

class VehicleTest < Minitest::Test
  def test_it_exists
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    assert_instance_of Vehicle, vehicle
  end

  def test_it_has_a_year
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    assert_equal "2001", vehicle.year
  end

  def test_it_has_a_make
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    assert_equal "Honda", vehicle.make
  end

  def test_it_has_a_model
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    assert_equal "Civic", vehicle.model
  end

  def test_it_is_not_speeding
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    assert_equal false, vehicle.speeding?
  end

  def test_it_can_speed
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    vehicle.speed
    assert_equal true, vehicle.speeding?
  end

  def test_it_has_passengers
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    assert_equal [], vehicle.passengers
  end

  def test_it_can_add_passengers
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    vehicle.add_passenger(charlie)
    vehicle.add_passenger(jude)
    vehicle.add_passenger(taylor)
    assert_equal [charlie,jude,taylor], vehicle.passengers
  end

  def test_it_can_tell_number_of_adults
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    vehicle.add_passenger(charlie)
    vehicle.add_passenger(jude)
    vehicle.add_passenger(taylor)
    assert_equal 2, vehicle.num_adults
  end
end
