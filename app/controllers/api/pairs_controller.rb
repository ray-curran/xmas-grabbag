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

  def allpairs
    trades_with_names = Trade.last.pairs.map do |trade|
        {id: trade.id,
        recipient_id: trade.recipient_id,
        giver_id: trade.giver_id,
        trade_id: trade.trade_id,
        recipient: Person.find_by_id(trade.recipient_id).name,
        giver: Person.find_by_id(trade.giver_id).name}
    end
    render json: trades_with_names
  end

  def tradegifts
    gifts = Trade.last.gifts.map do|gift|
      {id: gift.id,
        name: gift.name,
        bought: gift.bought,
        pair_id: gift.pair_id,
        recipient_id: gift.recipient.id}
    end
    render json: gifts
  end

  def allpeople
    render json: Person.all
  end

  def login
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user
    else
      return nil
    end
  end

  def logout
    session[:user_id] = nil
    render json:{success: 'logged out'}
  end

  def loggedin
    render json: current_user
  end



end