class SessionsController < Clearance::SessionsController
    def create
        @user = authenticate(params)

        if @user && @user.enabled == false
          render template: "sessions/new", status: :unauthorized
          return
        end
    
        sign_in(@user) do |status|
          if status.success?
            redirect_back_or url_after_create
          else
            render template: "sessions/new", status: :unauthorized
          end
        end
    end
end