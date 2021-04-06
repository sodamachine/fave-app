class UsersController < ApplicationController

    get '/signup' do
        if session[:user_id]
          redirect "/users/#{session[:user_id]}"
        end
        erb :'users/signup'
    end

    post '/users' do
        u = User.create(params[:user])
        session[:user_id] = u.id
        redirect "/users/#{u.id}"
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'users/show'
    end




end