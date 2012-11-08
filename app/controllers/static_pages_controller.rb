class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost  = current_user.microposts.build(params[:micropost])
      @contact = current_user.contacts.build(params[:contact])
      @ask = current_user.asks.build(params[:ask])
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact_us

  end
end
