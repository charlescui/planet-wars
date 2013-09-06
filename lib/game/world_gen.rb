class WorldGen
  attr_reader :number_of_planets, :width, :height

  def initialize(number_of_planets, width, height)
    @number_of_planets = number_of_planets
    @width = width
    @height = height

    number_of_planets.times do
      Planet.create(x: rand(100..width-100), y: rand(100..height-100), zorder: 0)
    end

    Portal.create(world_width: @width, world_height: @height, x: rand(100..width-100), y: rand(100..height-100), zorder: 199)
  end
end