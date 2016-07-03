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
    Gift.create({name: params[:name], pair: pairing })

    render plain: 'gift created!'
  end

end