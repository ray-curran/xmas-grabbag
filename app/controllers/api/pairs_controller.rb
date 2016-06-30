class Api::PairsController < ApplicationController

  def kidpairs
    kids_trades = Trade.last.pairs.select{|pair| Person.find_by_id(pair.recipient_id).adult_or_kid == 'kid'}
    trades_with_names = kids_trades.map do |trade|
        {id: trade.id,
        recipient_id: trade.recipient_id,
        giver_id: trade.giver_id,
        trade_id: trade.trade_id,
        recipient: Person.find_by_id(trade.recipient_id).name,
        giver: Person.find_by_id(trade.giver_id).name}
    end
    render json: trades_with_names
  end

  def adultpairs
    adults_trades = Trade.last.pairs.select{|pair| Person.find_by_id(pair.recipient_id).adult_or_kid == 'adult'}
    trades_with_names = adults_trades.map do |trade|
        {id: trade.id,
        recipient_id: trade.recipient_id,
        giver_id: trade.giver_id,
        trade_id: trade.trade_id,
        recipient: Person.find_by_id(trade.recipient_id).name,
        giver: Person.find_by_id(trade.giver_id).name}
    end
    render json: trades_with_names
  end

end