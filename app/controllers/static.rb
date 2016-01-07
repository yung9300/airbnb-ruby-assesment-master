require'byebug'
get '/' do
  erb :"static/index"
end

get '/signuppage' do
	erb :"static/sup"
end

get '/home' do
	@properties = Property.all
	erb :"static/home"
end

get '/signupsuccess' do
  erb :"static/signupsuccess"
end

get '/allproperty' do
  @comments = Comment.all
  @properties = Property.all
  erb :"static/allproperty"
end

get '/loginfail' do
  erb:"static/fail"
end

post '/signup' do

  @user = User.new(params[:user])
  @user.password = params[:password]
  # byebug
  if @user.save!
  	redirect '/signupsuccess'
  # erb :"users/user-register"
else
  redirect '/signuppage'
end
end

get '/listsuccess' do
	erb :"static/listsuccess"
end

post '/listing' do
	# byebug
	@property = Property.new(params[:property], user_id: session[:user_id])
	if @property.save!
		redirect '/listsuccess'
	else
		return ''
	end
end

post '/comment' do
  @comment = Comment.new(params[:comment], user_id: session[:user_id])
  if @comment.save!
    redirect '/allproperty'
  else
    return ''
  end
end

post '/login' do
 
  if @user = User.find_by(email: params[:user][:email])
  @user.password == params[:password_hash]
    session[:user_id] = @user.id
    redirect '/home'
  else
    redirect '/loginfail'
  end
end 

post '/logout' do
  session[:user_id] = nil 
redirect '/'
end

	
