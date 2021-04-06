class FavesController < ApplicationController

    get '/faves' do
        redirect_if_not_logged_in
        @faves = Fave.all
        erb :'faves/index'
    end

    get '/faves/new' do
        redirect_if_not_logged_in
        erb :'faves/new'
    end

    post '/faves' do
        fave = current_user.faves.create(params[:fave])
        redirect "faves/#{fave.id}"
    end

    get '/faves/:id' do
        redirect_if_not_logged_in
        @fave = Fave.find_by(id: params[:id])
        if !@fave
            redirect '/faves'
        end
        erb :'faves/show'
    end

    get '/faves/:id/edit' do
        redirect_if_not_logged_in
        @fave = Fave.find_by(id: params[:id])
        if check_owner(@fave)
          redirect '/faves'
        end
        erb :'faves/edit'
    end
    
    patch '/faves/:id' do
        redirect_if_not_logged_in
        @fave = Fave.find_by(id: params[:id])
        if check_owner(@fave)
            @fave.update(params[:fave])
        end
        erb :'faves/show'
    end

    delete '/faves/:id' do
        redirect_if_not_logged_in
        @fave = Fave.find_by(id: params[:id])
        if check_owner(@fave)
            @fave.delete
            redirect '/faves'
        else
            erb :'faves/show'
        end
    end

end