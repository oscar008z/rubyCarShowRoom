class CarMaker
  @@numbersOfStock = {
    "Honda"=>0,
    "Toyota"=>0,
    "Mercedes"=>0,
    "BMW"=>0,
    "Lexus"=>0
  }
  @nameOfMaker

  def initialize(nameOfMaker)
    @nameOfMaker = nameOfMaker
    @@numbersOfStock[nameOfMaker] += 1
  end

  def getCounterOfMaker
    return @nameOfMaker
  end

  def CarMaker.countMaker
    return @@numbersOfStock
  end
end