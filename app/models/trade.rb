class Trade < ActiveRecord::Base
  has_many :pairs
  has_many :gifts, through: :pairs

  def self.last_two_trades
    Trade.last.pairs.map{|pair| {recipient_id: pair.recipient_id, giver_id: pair.giver_id}}
  end

  def self.no_selfies(trade_objects)
    trade_objects.select{|trade| trade[:recipient_id] == trade[:giver_id]}.length == 0
  end

  def self.no_families(trade_objects)
    trade_objects.select do |trade| 
      id =  trade[:recipient_id]
      Person.find_by_id(id).nil?
      puts id if Person.find_by_id(id).nil?
      Person.find_by_id(trade[:recipient_id]).family_id == Person.find_by_id(trade[:giver_id]).family_id
    end.length == 0
  end

  def self.no_overlap(trade_objects)
    (last_two_trades & trade_objects).length == 0
  end

  def self.restrictions(trade_objects)
    no_overlap(trade_objects) && no_selfies(trade_objects) && no_families(trade_objects)
  end

  def self.make_another
    kid_trades = make_kid
    until restrictions(kid_trades)
      kid_trades = make_kid
    end
    adult_trades = make_adult
    until restrictions(adult_trades)
      adult_trades = make_adult
    end
    new_trade = Trade.create(year: Trade.last.year + 1)
    new_trade.pairs.create(kid_trades)
    new_trade.pairs.create(adult_trades)
  end

  def self.make_adult
    possible_giftee_ids = Person.where('adult_or_kid = ? and active = true', 'adult').map(&:id)
    adults = Person.where('adult_or_kid = ? and active = true', 'adult').map{ |person| { recipient_id: nil, giver_id: person.id}}
    adults.each do |adult|
      adult[:recipient_id] = possible_giftee_ids.sample
      possible_giftee_ids.delete(adult[:recipient_id])
    end
    adults
  end

  def self.make_kid
    possible_giftee_ids = Person.where('adult_or_kid = ? and active = true', 'kid').map(&:id)
    kids = Person.where('adult_or_kid = ? and active = true', 'kid').map{ |person| { recipient_id: nil, giver_id: person.id}}
    kids.each do |kid|
      kid[:recipient_id] = possible_giftee_ids.sample
      possible_giftee_ids.delete(kid[:recipient_id])
    end
    kids
  end

end
