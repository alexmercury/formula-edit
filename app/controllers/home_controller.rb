class HomeController < ApplicationController

  def index

    render 'home/index'

  end

  def editor

    render 'home/editor', layout: false

  end


  def formula

    render 'home/formula', layout: false

  end

end