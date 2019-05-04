require "C:/Users/oscar/.RubyMine2018.2/config/scratches/scratch_2.rb"

class CarCatalogue
  def initialize()
    @arrCars = Array.new
  end
  def getCars()
    return @arrCars
  end

  def convertListings2Catalougue(fileName, opCode)
    flag = 0
    fr = File.open(fileName)
    arrCarListing = fr.readlines()
    fr.close

    if opCode=="a"
      arrCarListingTemp = arrCarListing[arrCarListing.length-1]
      arrCarListing = Array.new(1)
      arrCarListing[0] = arrCarListingTemp
    end

    if arrCarListing !=""
      n = 0
      while n<arrCarListing.length
        milage = ""
        type = ""
        transmission = ""
        stockNumber = ""
        drivetrain = ""
        status = ""
        fuelEconomy = ""
        maker = ""
        model = ""
        year = ""
        trim = ""
        flag = 0
        features = arrCarListing[n].to_s.match(/\,{[\S\s]+\}/)
        features = features.to_s.gsub(/,/,"")

        arrCarListing[n] = arrCarListing[n].to_s.gsub(/\,{[\S\s]+\}/,"")
        arrCurLine = ""
        arrCurLine = arrCarListing[n].to_s.split(",")
        m = 0
        while m<arrCurLine.length
          curField = arrCurLine[m].strip
          if (curField =~ /^\d+[Kk][Mm]$/)
            milage = curField
          elsif (curField =~ /[Ss]edan|[Cc]oupe|[Hh]atchback|[Ss]tation|[Ss][Uu][Vv]/)
            type = curField
          elsif (curField =~ /[Aa]uto|[Mm]anual|[Ss]teptronic/)
            transmission = curField
          elsif (curField =~ /(^\d+\w+)([^[Kk][Mm]|\d|\n]$)|(^[A-Za-z]+\w+)([^[k][m]|[A-Za-z]|\n]$)/)
            stockNumber = curField
          elsif (curField =~ /[Ff][Ww][Dd]|[Rr][Ww][Dd]|[Aa][Ww][Dd]/)
            drivetrain = curField
          elsif (curField =~ /[Uu][Ss][Ee][Dd]|[Nn][Ee][Ww]/)
            status = curField.to_s.upcase
          elsif (curField =~ /^\d+L\/100[Kk][Mm]|^\d+\.\d+L\/100[Kk][Mm]/)
            fuelEconomy = curField
          elsif (curField =~ /[Hh][Oo][Nn][Dd][Aa]|[Tt][Oo][Yy][Eo][Tt][Aa]|[Mm][Ee][Rr][Cc][Ee][Dd][Ee][Ss]|[Bb][Mm][Ww]|[Ll][Ee][Xx][Uu][Ss]/)
            maker = curField.to_s.downcase
            if(maker!="bmw")
              maker[0] = maker[0].to_s.upcase
            else
              maker = maker.upcase
            end
          elsif (curField =~ /^\d{4}$/)
            year = curField
          elsif (curField =~ /^[A-Za-z]{2}$/)
            trim = curField
          else
            model = curField
          end
          m += 1
        end
        if milage!="" && type!="" && transmission!="" && stockNumber!="" && drivetrain!="" && status!="" && fuelEconomy!="" && maker!="" && model!="" && year!="" &&  trim!="" &&  features!=""
          car = CarModel.new(milage, type, transmission, stockNumber, drivetrain, status, fuelEconomy, maker, model, year, trim, features)
          flag = 1
          if opCode=="a"
            @arrCars[@arrCars.length] = car
          else
            @arrCars[n] = car
          end
        end
        n += 1
      end
    end
    return flag
  end

  def searchInventory(hashPair)
    hashPair.each_pair do |key, value|
      if key==""
        return "key is empty"
      else
        n = 0
        m = 0
        arrRes = Array.new
        while n<@arrCars.length
          case key.to_s
          when "milage"
            if @arrCars[n].milage==value
              arrRes[m] = @arrCars[n]
              m += 1
            end
          when "type"
            if @arrCars[n].type==value
              arrRes[m] = @arrCars[n]
              m += 1
            end
          when "transmission"
            if @arrCars[n].transmission==value
              arrRes[m] = @arrCars[n]
              m += 1
            end
          when "stockNumber"
            if @arrCars[n].stockNumber==value
              arrRes[m] = @arrCars[n]
              m += 1
            end
          when "drivetrain"
            if @arrCars[n].drivetrain==value
              arrRes[m] = @arrCars[n]
              m += 1
            end
          when "status"
            if @arrCars[n].status==value
              arrRes[m] = @arrCars[n]
              m += 1
            end
          when "fuelEconomy"
            if @arrCars[n].fuelEconomy==value
              arrRes[m] = @arrCars[n]
              m += 1
            end
          when "maker"
            if @arrCars[n].maker==value
              arrRes[m] = @arrCars[n]
              m += 1
            end
          when "model"
            if @arrCars[n].model==value
              arrRes[m] = @arrCars[n]
              m += 1
            end
          when "year"
            if @arrCars[n].year==value
              arrRes[m] = @arrCars[n]
              m += 1
            end
          when "trim"
            if @arrCars[n].type==value
              arrRes[m] = @arrCars[n]
              m += 1
            end
          when "features"
            if @arrCars[n].features==value
              arrRes[m] = @arrCars[n]
              m += 1
            end
          else
            return "this keyword is not an attribute of any car"
          end
          n += 1
        end
        if m==0
          return ""
        else
          return arrRes
        end
      end
    end
  end

  def add2Inventory(fileName, newListing)
    File.open(fileName,"a+") {|file| file.write"\n#{newListing}"}
    self.convertListings2Catalougue(fileName, "a")
  end

  def saveCatalogue2File(saveFileName)
    n = 0
    arrTemp = Array.new
    while n<@arrCars.length
      if n==0
        arrTemp[0] = @arrCars[0]
      else
        m = 0
        while m < arrTemp.length
          if @arrCars[n].maker[0].to_s>arrTemp[m].maker[0].to_s
            temp = arrTemp[m]
            arrTemp[m] = @arrCars[n]
            @arrCars[n] = temp
          end
          m += 1
        end
        arrTemp[n] = @arrCars[n]
      end
      n += 1
    end
    @arrCars = arrTemp
    x = 0
    while x<@arrCars.length
      File.open(saveFileName, "a+"){|file| file.write "\n#{@arrCars[x].to_s}"}
      x += 1
    end
  end
end
