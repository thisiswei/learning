#chapter 10

class Array
  def eachEven(&wasABlock_nowAproc)
    isEven = true
    self.each do |obj|
      if isEven
        wasABlock_nowAproc.call obj
      end
      isEven = (not isEven)
    end
  end
end

sheisabeast = []
sentence = ['she','me','is','oh','a','what','beast'].eachEven do |she|
  sheisabeast << she
end
puts sheisabeast.join(' ')

#=============================================================================

def profile descriptionOfBlock, &block
  startTime = Time.now
  block.call
  duration = Time.now - startTime
  puts descriptionOfBlock + ": " + duration.to_s + ' seconds'
end

profile '25000 dublings' do
  number = 1
  25000.times do 
    number += number
  end
end

profile 'lilwayne amili' do
  number = 0 
  1000000.times do 
    number += 1 
  end
end
#=============================================================================
#  A few things to try

def grandpa_clock &block
  start_hour = 0 
  now_hour = Time.now.hour
  (now_hour - start_hour).times do
    block.call
  end
end

grandpa_clock do 
  puts "Dong!"
end

grandpa_clock do
  puts "time is precious"
end
    #=============================================================================

def logger(description_of_block, some_proc)
 puts "Begining learning ruby...."
 some_proc.call
 puts "finish..#{description_of_block}..returning: #{some_proc.call}"
end

apply_to_gschool = Proc.new do
  1+1
end

logger 'learning..ruby',apply_to_gschool
