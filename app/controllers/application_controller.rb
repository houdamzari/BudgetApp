class ApplicationController < ActionController::Base
  content_security_policy false, only: :index
end
