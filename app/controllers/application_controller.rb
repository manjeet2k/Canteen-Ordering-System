class ApplicationController < ActionController::Base
  include SessionsHelper
  include CartsHelper  
  include AdminsHelper
end

