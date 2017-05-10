class HomeController < ApplicationController
  def index
    @pp = Post.all.reverse  #if you wanna have a look; use @ AND ALSO if put '.reverse' you can view comments recently
  end
  
  def write
    pp = Post.new #Post= database name
    pp.title = params[:tt]  #
    pp.content = params[:cc] #same as html name="~~"
    pp.save
    redirect_to '/home/index'  #redirect to ~~
  end
  
  #index/route/controller
  
  def delete
    pp = Post.find(params[:id])  #find id
    pp.delete
    redirect_to '/home/index'  #redirect to ~~
  end
  
  #routes
  def update
    @pp = Post.find(params[:id])
  end
  
  def updates
    pp = Post.find(params[:id])
    pp.title = params[:tttt]
    pp.content = params[:cccc]
    pp.save
    
    redirect_to '/home/index' 
  
  end
  
  
end
