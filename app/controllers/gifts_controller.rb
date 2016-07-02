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

end