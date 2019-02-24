class UserDashboardFacade

  attr_reader :user,
              :topic

  def initialize(user, topic)
    @user = user
    @topic = topic
  end

  def vaild_topic?
    service.search_results(topic).has_key?(:total_results)
  end

  def advice
    if topic && vaild_topic?
      service.search_results(topic)[:slips].sample[:advice]
    else
      "Please enter a vaild topic to recive advice."
    end
  end

  private

  def service
   service = AdviceService.new
  end
end
