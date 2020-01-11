class Dashboard::BaseController < ApplicationController
  before_action :require_registered_user
end
