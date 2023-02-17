class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to gossips_path, notice: "ok t'es créé"
        else 
            flash.now[:danger] = 'recommence'
            render :new
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :city_id, :password)
    end 

    def destroy
    end

end 
