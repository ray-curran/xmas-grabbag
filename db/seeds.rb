Family.destroy_all
Person.destroy_all
Gift.destroy_all
Trade.destroy_all
Pair.destroy_all

families_for_creation = [
  {name: 'Curran'},
  {name: "Sean O'Shea"},
  {name: 'Ivetic'},
  {name: "Tommy O'Shea"},
  {name: "Mike O'Shea"},
  {name: "Kruse"},
  {name: "Brian O'Shea"}
]

Family.create!(families_for_creation)

currans_for_creation = [
  {name: 'Ray', adult_or_kid: 'adult', birthday: Date.new(1957,5,27)},
  {name: 'Raymond', adult_or_kid: 'kid', birthday: Date.new(1988,10,25)},
  {name: 'Kaitlin', adult_or_kid: 'kid', birthday: Date.new(1987,4,17)},
  {name: 'Brendan', adult_or_kid: 'kid', birthday: Date.new(1991,2,19)},
  {name: 'Theresa', adult_or_kid: 'kid', birthday: Date.new(1992,12,19)},
  {name: 'Mary Pat', adult_or_kid: 'adult', birthday: Date.new(1960,7,5)}
]

seans_for_creation = [
  {name: 'Sean', adult_or_kid: 'adult', birthday: Date.new(1958,10,5)},
  {name: 'Karen', adult_or_kid: 'adult', birthday: Date.new(1957,4,10)},
  {name: 'Sean & Meaghan', adult_or_kid: 'adult', birthday: Date.new(1985,3,21)},
  {name: 'Megan', adult_or_kid: 'kid', birthday: Date.new(1988,6,12)},
  {name: 'Shannon', adult_or_kid: 'kid', birthday: Date.new(1986,8,14)},
  {name: 'Erin', adult_or_kid: 'kid', birthday: Date.new(1983,10,4)},
  {name: 'Rory', adult_or_kid: 'kid', birthday: Date.new(2005,3,25)},
  {name: 'Reid', adult_or_kid: 'kid', birthday: Date.new(2015,1,21)}
]

ivetics_for_creation = [
  {name: 'Nancy', adult_or_kid: 'adult', birthday: Date.new(1961,10,9)},
  {name: 'Jim', adult_or_kid: 'adult', birthday: Date.new(1957,8,11)},
  {name: 'Jay & Tammy', adult_or_kid: 'adult', birthday: Date.new(1984,2,28)},
  {name: 'Allyse & Jean', adult_or_kid: 'adult', birthday: Date.new(1985,8,9)},
  {name: 'Danny', adult_or_kid: 'kid', birthday: Date.new(1989,2,3)},
  {name: 'Emma', adult_or_kid: 'kid', birthday: Date.new(2013,6,27)}
]

tommys_for_creation = [
  {name: 'Tommy', adult_or_kid: 'adult', birthday: Date.new(1967,1,29)},
  {name: 'Colin', adult_or_kid: 'kid', birthday: Date.new(1992,12,1)},
  {name: 'Tommy', adult_or_kid: 'kid', birthday: Date.new(1990,8,4)},
  {name: 'Courtney', adult_or_kid: 'kid', birthday: Date.new(1988,10,29)}
]

mikes_for_creation = [
  {name: 'Mike', adult_or_kid: 'adult', birthday: Date.new(1963,8,29)},
  {name: 'Kim', adult_or_kid: 'adult', birthday: Date.new(1963,8,29)},
  {name: 'Michael', adult_or_kid: 'kid', birthday: Date.new(2000,5,25)},
  {name: 'Katie', adult_or_kid: 'kid', birthday: Date.new(1998,5,23)}
]

kruses_for_creation = [
  {name: 'Moe', adult_or_kid: 'adult', birthday: Date.new(1962,9,15)},
  {name: 'Niels', adult_or_kid: 'adult', birthday: Date.new(1962,4,9)},
  {name: 'Kaeleen', adult_or_kid: 'kid', birthday: Date.new(1995,8,28)},
  {name: 'Cameron', adult_or_kid: 'kid', birthday: Date.new(1997,9,22)}
]

brians_for_creation = [
  {name: 'Brian', adult_or_kid: 'adult', birthday: Date.new(1965,4,14)},
  {name: 'Sheila', adult_or_kid: 'adult', birthday: Date.new(1963,7,27)},
  {name: 'Brian', adult_or_kid: 'kid', birthday: Date.new(1991,3,13)},
  {name: 'Patrick', adult_or_kid: 'kid', birthday: Date.new(1992,7,20)},
  {name: 'Kevin', adult_or_kid: 'kid', birthday: Date.new(1993,12,20)},
  {name: 'James', adult_or_kid: 'kid', birthday: Date.new(1997,11,5)},
  {name: 'Johnny', adult_or_kid: 'kid', birthday: Date.new(1999,11,24)},
  {name: 'Kelly', adult_or_kid: 'kid', birthday: Date.new(2001,9,8)}
]

people_for_creation = [
  Family.find_by_name('Curran').people.create!(currans_for_creation),
  Family.find_by_name('Ivetic').people.create!(ivetics_for_creation),
  Family.find_by_name("Sean O'Shea").people.create!(seans_for_creation),
  Family.find_by_name("Tommy O'Shea").people.create!(tommys_for_creation),
  Family.find_by_name("Mike O'Shea").people.create!(mikes_for_creation),
  Family.find_by_name("Kruse").people.create!(kruses_for_creation),
  Family.find_by_name("Brian O'Shea").people.create!(brians_for_creation)
]

Trade.create!({year: 2013})

Trade.make_another
Trade.make_another

Trade.last.pairs.each do |pair|
  gifts_for_creation = [
    {pair: pair, name: 'Slinky'},
    {pair: pair, name: 'Robot'},
    {pair: pair, name: 'Stretch Armstrong'},
  ]
  Gift.create!(gifts_for_creation)
end

User.create(username: 'nancy', password: 'ivetic')

