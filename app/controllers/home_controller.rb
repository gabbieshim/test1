class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @pp = Post.all.reverse  #if you wanna have a look; use @ AND ALSO if put '.reverse' you can view comments recently
  end

  
  def write
    pp = Post.new #Post=database name
    pp.title = params[:tt]  #
    pp.content = params[:cc] #same as html name="~~"
    pp.user_id = current_user.id
    if pp.save
    
      redirect_to '/' #redirect to ~~
    else
      flash[:error] = pp.errors.messages[:title][0] #[:title][0]
      redirect_to '/'
      
    end
  end
  
  #index/route/controller
  
  def delete
    pp = Post.find(params[:id])  #find id
    pp.delete
    redirect_to '/'  #redirect to ~~
  end
  
  #routes
  def update
    @pp = Post.find(params[:id])
  end
  
  def updates
    pp = Post.find(params[:id])
    pp.title = params[:tttt]
    pp.content = params[:cccc]
    pp.user_id = current_user.id
    pp.save
    redirect_to '/' 
  end
  
end
