require "C:/Users/oscar/.RubyMine2018.2/config/scratches/scratch_1.rb"

class CarModel < CarMaker
  attr_accessor :milage, :type, :transmission, :stockNumber, :drivetrain, :status, :fuelEconomy, :maker, :model, :year, :trim, :features
  @milage
  @type
  @transmission
  @stockNumber
  @drivetrain
  @status
  @fuelEconomy
  @maker
  @model
  @year
  @trim
  @features

  def initialize(milage, type, transmission, stockNumber, drivetrain, status, fuelEconomy, maker, model, year, trim, features)
    super(maker)
    @milage = milage
    @type = type
    @transmission = transmission
    @stockNumber = stockNumber
    @drivetrain = drivetrain
    @status = status
    @fuelEconomy = fuelEconomy
    @model = model
    @year = year
    @trim = trim
    @features = features
    @maker = maker
  end

  def to_s
    return "#@maker, #@model, #@trim, #@milage, #@year, #@type, #@drivetrain, #@transmission, #@stockNumber, #@status, #@fuelEconomy, #@features"
  end
end