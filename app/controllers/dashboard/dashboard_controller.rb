class Dashboard::DashboardController < Dashboard::BaseController
  def index
      @favorites_facade = FavoriteFacade.new(@user)
  end
end
