class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def require_admin
    if session[:role] != 'admin'
      flash[:alert] = 'You do not have access to that page'
        redirect_to root_path
      end
    end
     def require_guest
    if session[:role] != 'guest'
      flash[:alert] = 'You do not have access to that page'
        redirect_to root_path
      end
    end
     def require_owner
    if session[:role] != 'owner'
      flash[:alert] = 'You do not have access to that page'
        redirect_to root_path
      end
    end
end
