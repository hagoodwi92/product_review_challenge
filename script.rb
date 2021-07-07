#!/usr/bin/ruby
require 'active_support/core_ext/enumerable'

class Script
  file = ARGV[0]
    newArrayR = Array.new
    File.foreach(file) do |line|
      if (line.include? "reject") 
        name = line.match(/[^\,]+(?=\-)/).to_s.strip
        if((newArrayR.exclude? name))
          newArrayR.push(name)
        end
      end
    end
    newArrayA = Array.new
    File.foreach(file) do |line|
      if (line.include? "approve") 
        name = line.match(/[^\,]+(?=\-)/).to_s.strip
        if((newArrayR.exclude? name) && (newArrayA.exclude? name))
          newArrayA.unshift(name)
        end
      end
    end


    File.write("newFile.txt", "APPROVED\n", mode: "w")
    File.write("newFile.txt", newArrayA.join("\n"), mode: "a")
    File.write("newFile.txt", "\n", mode: "a")
    File.write("newFile.txt", "\nDENIED\n", mode: "a")
    File.write("newFile.txt", newArrayR.join("\n"), mode: "a")
end


