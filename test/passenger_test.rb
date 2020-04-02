require 'minitest/autorun'
require 'minitest/pride'
require './lib/passenger'


class PassengerTest < Minitest::Test
  def test_it_exists
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    assert_instance_of Passenger, charlie
    assert_instance_of Passenger, taylor
  end

  def test_it_has_a_name
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    assert_equal "Charlie", charlie.name
  end

  def test_it_has_an_age
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    assert_equal 18, charlie.age
  end

  def test_it_is_an_adult
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    assert_equal true, charlie.adult?
    assert_equal false, taylor.adult?
  end

  def test_it_is_a_driver
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    assert_equal false, charlie.driver?
  end

  def test_it_can_become_a_driver
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    charlie.drive
    assert_equal true, charlie.driver?
  end
end
