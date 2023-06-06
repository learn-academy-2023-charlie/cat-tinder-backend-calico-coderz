cats = [
    # {name:'Winston',
    # age:3,
    # hobbies:'hunting birds',
    # image:"https://freesvg.org/img/OnlyWine-186.png"}
]

cats.each do |each_cat|
    Cat.create each_cat
    puts "creating cat #{each_cat}"
end