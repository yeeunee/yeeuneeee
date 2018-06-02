Rails.application.routes.draw do


  devise_for :users
  root 'home#index'
  
  get '/edit/:id' => 'post#edit'
  
  #post
  get '/post/index' => 'post#index'
  get '/post/:id' => 'post#show'
  post '/post' => 'post#create'
  post '/post/:id' => 'post#update'
  delete '/post/:id' => 'post#delete'
  
  #comment
  post '/comment/:id' => 'comment#create'
  delete '/comment/:id' => 'comment#delete'
  
end
