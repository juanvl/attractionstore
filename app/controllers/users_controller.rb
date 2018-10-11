class UsersController < Clearance::UsersController
    def create
        @user = user_from_params

        if @user.save
            @company = Company.new
            @company.user = @user
            @company.save

            sign_in @user
            redirect_back_or url_after_create
        else
            render template: "users/new"
        end
    end
end
