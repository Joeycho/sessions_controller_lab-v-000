class SessionsController < ApplicationController
  def create
    if params[:name]== nil || params[:name]== ""
      redirect_to '/login'
    else
      session[:name]=params[:name]
    end
  end
end
