module UsersHelper
    private 
    def user_params
        params.require(:users).permit(:name)
    end
end
