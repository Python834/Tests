# MrCoffee Class

class MrCoffee
  @@max_water_level = 32.0 # oz
  @@max_coffee_level = 4.0 # oz
  @@standard_cup  = 8.0 # oz - amount of water used to brew coffee

  attr_reader :power, :water_level, :coffee_level

  def initialize()
    @power = false # boolean
    @water_level = 0.0 # float - oz
    @coffee_level = 0.0 # float - oz  (dry)

    @clock = 0 # time
    @brewing_time = 0 # time
    @element_temp = 0.0 # float (degrees C)

    @brewed_coffee_level = 0.0 # float - oz  (finished coffee)
    @filter = false # boolean
    @brewing = false # Brewing is happening
  end

  def turn_on
    @power = true
  end

  def turn_off
    @power = false
  end

  def add_filter
    @filter = true
  end

  def remove_filter
    @filter = false
  end

  def add_water( ounces )
    @water_level += ounces
    if( @water_level > @@max_water_level )
      @water_level = @@max_water_level
    end
  end

  def remove_water( ounces )
    @water_level -= ounces
    if( @water_level < 0.0 )
      @water_level = 0.0    # Pegging at 0
    end
  end

  def add_coffee( ounces )  #TODO:  make sure there is a filter first
    @coffee_level += ounces
    if( @coffee_level > @@max_coffee_level )
      @coffee_level = @@max_coffee_level
    end
  end

  def brew
    #  Must be on, have water, have filter, have coffee grounds
    if( @power && @water_level > 0.0 && @filter && @coffee_level > 0.0 )
      @brewing = true

      remove_water( @@standard_cup )
      @coffee_level -= 2.0 # TODO: Peg this variable to zero
      remove_filter
      @brewed_coffee_level += @@standard_cup  # TODO: Peg
      @brewing = false

      return 'Your coffee is ready'
    else
      return "Can't Brew right now - missing stuff:\n Water Level: #{@water_level}\nCoffee Level: #{@coffee_level}
      \nFilter: #{@filter}\nPower: #{@power}\n"
    end
  end

  def max_water_level
    return @@max_water_level
  end

  def max_coffee_level
    return @@max_coffee_level
  end

  def standard_cup
    return @@standard_cup
  end

  def brewed_coffee_level
    return @brewed_coffee_level
    end

  def filter
    return @filter
  end

  def brewing
    return @brewing
  end

  def coffee_level
    return @coffee_level
  end

end

# # Main Program
#
# my_coffee = MrCoffee.new()
#
# puts my_coffee.inspect
# my_coffee.turn_on
# puts my_coffee.power
# my_coffee.turn_off
# puts my_coffee.power
#
# my_coffee.add_water( 20 )
# puts my_coffee.inspect
#
# my_coffee.add_water( 10 )
# puts my_coffee.inspect
# puts my_coffee.water_level
#
# my_coffee.add_water( 10.9 )
# puts my_coffee.inspect
#
# my_coffee.add_coffee(16)
# puts my_coffee.inspect
#
# puts my_coffee.brew
# my_coffee.turn_on
# my_coffee.add_filter
#
# puts my_coffee.brew
#
#
# # play
#   @save_time = Time.now.to_i
#
# # stop
#   @stop_time = Time.now.to_i
#   elapsed_time = @stop_time - @save_time
