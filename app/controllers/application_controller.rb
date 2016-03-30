class ApplicationController < ActionController::Base
  include Authentication
  include Authorization

  before_action :authenticate_user!
  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  # def self.local_prefixes
  #   [controller_path, controller_path.split("/")[1..-1].join("/")]
  # end
end
