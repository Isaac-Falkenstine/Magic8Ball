class UserDashboardFacade

  attr_reader :user,
              :topic,
              :get_random

  def initialize(user, topic, get_random)
    @user = user
    @topic = topic
    @get_random = get_random
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

  def random_advice
    if get_random
      service.random_advice[:slip][:advice]
    else
      "Click here to get random advice"
    end
  end

  private

  def service
   service = AdviceService.new
  end
end
