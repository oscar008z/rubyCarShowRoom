arrChar = Array["Adam","Eve","Mark","Franklin","John"]

def counterArrChar(arrChar)
  arrSort(arrChar,0)
  arrChar.each {
      |item|
    puts "#{item}, ch_count = #{item.length}\n\n"
  }
end

def arrSort(arrChar, n)
  if n==arrChar.length-2
    if  arrChar[n][0] > arrChar[n+1][0]
      tempChar = arrChar[n]
      arrChar[n] = arrChar[n+1]
      arrChar[n+1] = tempChar
    end
  else
    if  arrChar[n][0] > arrChar[n+1][0]
      tempChar = arrChar[n]
      arrChar[n] = arrChar[n+1]
      arrChar[n+1] = tempChar
    end
    arrSort(arrChar,n+1)
  end
end

counterArrChar(arrChar)

