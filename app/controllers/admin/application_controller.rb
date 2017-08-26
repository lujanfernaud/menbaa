# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    include ApplicationHelper
    include SessionsHelper

    before_action :authenticate_admin

    def authenticate_admin
      return if admin?

      if not_admin?
        flash[:danger] = "You don't have the rights to access this resource."
        redirect_to root_url
      else
        flash[:danger] = "You need to be logged in to access this resource."
        redirect_to login_path
      end
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
