class PagesController < ApplicationController
  def help

  end

  def admin
    @stock = Stock.new
    render "admin_panel"
  end
end
