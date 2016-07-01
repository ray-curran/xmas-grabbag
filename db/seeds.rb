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
  {name: 'Mary Pat', adult_or_kid: 'adult', birthday: Date.new(1959,7,5)}
]

seans_for_creation = [
  {name: 'Sean', adult_or_kid: 'adult'},
  {name: 'Karen', adult_or_kid: 'adult'},
  {name: 'Sean & Mae', adult_or_kid: 'Adult'},
  {name: 'Megan', adult_or_kid: 'kid'},
  {name: 'Shannon', adult_or_kid: 'kid'},
  {name: 'Erin', adult_or_kid: 'kid'},
  {name: 'Rory', adult_or_kid: 'kid'},
  {name: 'Reid', adult_or_kid: 'kid'}
]

ivetics_for_creation = [
  {name: 'Nancy', adult_or_kid: 'adult'},
  {name: 'Jim', adult_or_kid: 'adult'},
  {name: 'Jay & Tammy', adult_or_kid: 'adult'},
  {name: 'Allyse & Jean', adult_or_kid: 'adult'},
  {name: 'Danny', adult_or_kid: 'kid'},
  {name: 'Emma', adult_or_kid: 'kid'}
]

people_for_creation = [
  Family.find_by_name('Curran').people.create!(currans_for_creation),
  Family.find_by_name('Ivetic').people.create!(ivetics_for_creation),
  Family.find_by_name("Sean O'Shea").people.create!(seans_for_creation)
]

Trade.create!({year: 2015})

pairs_for_2015 = [
  {recipient: Person.find_by_name('Nancy'), giver: Person.find_by_name('Mary Pat'), trade: Trade.first},
  {recipient: Person.find_by_name('Mary Pat'), giver: Person.find_by_name('Karen'), trade: Trade.first},
  {recipient: Person.find_by_name('Karen'), giver: Person.find_by_name('Ray'), trade: Trade.first},
  {recipient: Person.find_by_name('Ray'), giver: Person.find_by_name('Nancy'), trade: Trade.first},
  {recipient: Person.find_by_name('Raymond'), giver: Person.find_by_name('Megan'), trade: Trade.first},
  {recipient: Person.find_by_name('Megan'), giver: Person.find_by_name('Kaitlin'), trade: Trade.first},
  {recipient: Person.find_by_name('Kaitlin'), giver: Person.find_by_name('Shannon'), trade: Trade.first},
  {recipient: Person.find_by_name('Shannon'), giver: Person.find_by_name('Raymond'), trade: Trade.first}
]

Trade.first.pairs.create!(pairs_for_2015)

gifts_for_creation = [
  {pair: Pair.first, name: 'Slinky'},
  {pair: Pair.first, name: 'Robot'},
  {pair: Pair.first, name: 'Stretch Armstrong'},
]

Gift.create!(gifts_for_creation)