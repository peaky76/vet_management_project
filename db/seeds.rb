require_relative( "../models/pet.rb" )
require_relative( "../models/owner.rb" )
require_relative( "../models/vet.rb" )
require("pry-byebug")

def random_tel()
    part_1 = rand(500) + 499
    part_2 = rand(9999)
    return "(0131) #{part_1} #{part_2}"
end

Pet.delete_all()
Owner.delete_all()
Vet.delete_all()

vet_1 = Vet.new({
    'first_name' => "Sue",
    'last_name' => "Ollogee",
    'tel' => random_tel()
})

vet_2 = Vet.new({
    'first_name' => "Annie",
    'last_name' => "Mulcare",
    'tel' => random_tel()
})

vet_3 = Vet.new({
    'first_name' => "Abby",
    'last_name' => "Twah",
    'tel' => random_tel()
})

vets = [vet_1, vet_2, vet_3]
vets.each { |vet| vet.save()}

owner_1 = Owner.new({
    'title' => "Mr",
    'first_name' => "Al",
    'last_name' => "Sayshun",
    'addr_1' => "8 Bone Street",
    'addr_2' => "Dogville",
    'town_city' => "Edinburgh",
    'postcode' => "EH16 5AA",
    'email' => "alsayshun@pedigreechum.com",
    'tel' => random_tel()
})
owner_2 = Owner.new({
    'title' => "Ms",
    'first_name' => "Leigh",
    'last_name' => "Murr",
    'addr_1' => "8 Forest Street",
    'addr_2' => "Wildtown",
    'town_city' => "Edinburgh",
    'postcode' => "EH13 6ZZ",
    'email' => "leighmurr@intheforest.com",
    'tel' => random_tel()
})
owner_3 = Owner.new({
    'title' => "Col",
    'first_name' => "Harland",
    'last_name' => "Sanders",
    'addr_1' => "12 Kentucky Road",
    'addr_2' => "Fryville",
    'town_city' => "Edinburgh",
    'postcode' => "EH3 6KK",
    'email' => "colonel@kfc.com",
    'tel' => random_tel()
})

owners = [owner_1, owner_2, owner_3]
owners.each { |owner| owner.save()}

pet_1 = Pet.new({
    'name' => "Rover",
    'dob' => "1/4/2015",
    'type' => "dog",
    'owner_name' => "Al Sayshun",
    'owner_tel' => random_tel(),
    'notes' => "Has arthritis"
})

pet_2 = Pet.new({
    'name' => "Tiddles",
    'dob' => "4/1/2017",
    'type' => "cat",
    'owner_name' => "Shaw Tare",
    'owner_tel' => random_tel(),
    'notes' => "No tail"
})

pet_3 = Pet.new({
    'name' => "Joey",
    'dob' => "11/11/2019",
    'type' => "budgie",
    'owner_name' => "Bud Jerrigar",
    'owner_tel' => random_tel(),
    'notes' => "Broken wing"
})

pet_4 = Pet.new({
    'name' => "Twiggy",
    'dob' => "5/3/2020",
    'type' => "stick insect",
    'owner_name' => "Twiggy",
    'owner_tel' => random_tel(),
    'notes' => "Triple heart bypass"
})

pets = [pet_1, pet_2, pet_3, pet_4]
pets.each { |pet| pet.save() }

pet_1.assign_to_vet(vet_1.id)
pet_2.assign_to_vet(vet_1.id)
pet_3.assign_to_vet(vet_2.id)
pet_4.assign_to_vet(vet_2.id)
pets.each { |pet| pet.update() }

owner_2.addr_1 = "16 Forrest Street"
owner_2.update()
owner_3.delete()

binding.pry
nil
