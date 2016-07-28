class LoginController < ApplicationController
  def index
  	
  end
  def create
  	auth=request.env['omniauth.auth']	
 	 	#@envmnt={:token=>auth['credentials']['token'],:secret=>auth['credentials']['secret'],:provider=>auth.provider,:uid=>auth.uid,:name=>auth["info"]["name"],:nick_name=>auth["info"]["nickname"]}
 	user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_twitter_user(auth)
  	session[:user_id] = user.id
  	redirect_to root_url, :notice => "Signed in!"
  end
  def signout
  	session[:user_id] = nil
	redirect_to root_url, :notice => "Signed out!"
  end
  def tweet
    if current_user
      #Resque.enqueue(TweetWorker,current_user.id) 
      post =current_user.post_tweet
      if post.created?
        message="Your <strong> #{post.full_text} </strong> has been posted  at <strong>#{post.created_at}</strong>.."
      else
        message="Your tweet has not been posted  .."
      end
    else
      message="Please login to continue.."
    end
    flash[:message]=message
    redirect_to (:back)
  end
end