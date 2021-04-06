class ApplicationController < Sinatra::Base

    configure do
        set :views, 'app/views'
        enable :sessions
        set :session_secret, 'secret'
    end

    get('/') do
        erb :home
    end

    helpers do

        def current_user
            @user = User.find_by(id: session[:user_id])
        end

        def current_fave
            @fave = Fave.find_by(id: params[:id])
        end

        def redirect_if_not_logged_in
            redirect '/login' unless current_user
        end

        def check_owner
            current_fave && current_fave.user == current_user
        end

end