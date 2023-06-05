cats.each do |each_cat|
    Cat.create each_cat
    puts "creating cat #{each_cat}"
end