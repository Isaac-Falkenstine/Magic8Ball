class AdvicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    advice_user = params.to_unsafe_h.key("").split("!!!")
    user = User.find_by(email: advice_user.last)
    advice = Advice.new(body: advice_user.first, user_id: user.id)
    if advice.save
      flash[:notice] = "Advice Saved!"
      redirect_to dashboard_path
    end
  end
end
