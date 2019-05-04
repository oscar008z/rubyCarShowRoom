require "C:/Users/oscar/.RubyMine2018.2/config/scratches/scratch.rb"
require "C:/Users/oscar/.RubyMine2018.2/config/scratches/scratch_1.rb"

fileName = "G:/2018/fall/COMP348/Assignment/A3/carListing.txt"
carCatShow = CarCatalogue.new
carCatShow.convertListings2Catalougue(fileName, "")
arrCars = carCatShow.getCars()

#test for question1 of problem3
n = 0
while n<arrCars.length
  puts arrCars[n].to_s
  n += 1
end

counts = CarMaker.countMaker
counts.each_pair do |key, value| puts "#{key} #{value}" end

#test for question2 of problem3
searchHash = {"maker" => "Honda"}
res = carCatShow.searchInventory(searchHash)
if res=="key is empty"
  puts res
elsif res=="this keyword is not an attribute of any car"
  puts res
elsif res==""
  puts "nothing matched"
else
  n = 0
  while n<res.length
    puts "cars matched are listed as following:"
    puts res[n]
    n += 1
  end
end

#test for question3 of problem3
newListing = "54993km,SUV,auto,B32A23,AWD,Used,12.5L/100km,toyota,Tacoma,SE,{AC, Heated Seats, Heated Mirrors, Keyless Entry},2014"
fileName = "G:/2018/fall/COMP348/Assignment/A3/carListing.txt"
carCatShow.add2Inventory(fileName, newListing)


#test for question4 of problem3
saveFileName = "G:/2018/fall/COMP348/Assignment/A3/saveCarCat.txt"
carCatShow.saveCatalogue2File(saveFileName)
arrCars = carCatShow.getCars()
n=0
while n<arrCars.length
  puts arrCars[n].to_s
  n += 1
end

