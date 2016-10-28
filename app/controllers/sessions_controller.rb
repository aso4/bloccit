class SessionsController < ApplicationController
    def new
    end

    def create
      Rails.logger.info "PARAMS #{session_params.inspect}"
        user = User.find_by(email: session_params[:login][:email].downcase)

        if user && user.authenticate(session_params[:login][:password])
            create_session(user)
            flash[:notice] = "Welcome, #{user.name}!"
            redirect_to root_path
        else
            flash.now[:alert] = 'Invalid email/password combination'
            render :new
        end
    end

    def destroy
        destroy_session(current_user)
        flash[:notice] = "You've been signed out, come back soon!"
        redirect_to root_path
    end

    private

    def session_params
        params.permit!
    end
end
