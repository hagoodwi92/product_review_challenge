require 'active_support/core_ext/enumerable'

class Test
  def reject()
    newArrayR = Array.new
    File.foreach('sample-input.txt') do |line|
      if (line.include? "reject") 
        name = line.match(/[^\,]+(?=\-)/).to_s.strip
        if((newArrayR.exclude? name))
          newArrayR.push(name)
        end
      end
    end
    return newArrayR
  end
  def accept()
    newArrayR = Array.new
    File.foreach("sample-input.txt") do |line|
      if (line.include? "reject") 
        name = line.match(/[^\,]+(?=\-)/).to_s.strip
        if((newArrayR.exclude? name))
          newArrayR.push(name)
        end
      end
    end
    newArrayA = Array.new
    File.foreach("sample-input.txt") do |line|
      if (line.include? "approve") 
        name = line.match(/[^\,]+(?=\-)/).to_s.strip
        if((newArrayR.exclude? name) && (newArrayA.exclude? name))
          newArrayA.unshift(name)
        end
      end
    end
    return newArrayA
  end

end