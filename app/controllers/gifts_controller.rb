class GiftsController < ApplicationController

  def markbought
    gift = Gift.find_by_id(params[:id])
    gift.update_attributes(bought: !gift.bought)

    render plain: "bought changed!"
  end

  def destroy
    gift = Gift.find_by_id(params[:id])
    gift.destroy

    render plain: 'gift destroyed!'
  end

  def create
    pairing = Trade.last.pairs.select { |pair| pair.recipient_id == params[:recipient_id].to_i }[0]
    gift = Gift.create({name: params[:name], pair: pairing })

    render json: {name: gift.name, pair_id: gift.pair_id, id: gift.id, bought: gift.bought}
  end

end