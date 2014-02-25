require 'monitor'
#asdfasdf
#dafdsaf
#adfdsafs
#adfsadf
class Demo 
  attr_reader :count
def initialize(name)
  @name = name
  @count = 0
end
def show(other)
while @count<20
while @count - other.count > 1
  Thread.pass
end
  @count+=1
  print @name+":"+@count.to_s+"\n"
end
end
def add
#synchronize do
  @count += 1
#end
end
end

d1 = Demo.new("A")
d2 = Demo.new("B")

threads = [
Thread.new{Thread.stop;d1.show(d2)},
Thread.new{Thread.stop;d2.show(d1)}
]

r=rand(2)

threads[r].run
threads[1-r].run
#threads.each{|t|t.join}

lock = Monitor.new

t1 = Thread.new{100_000.times{lock.synchronize{d1.add}}}
t2 = Thread.new{100_000.times{lock.synchronize{d1.add}}}

t1.join
t2.join

puts d1.count
