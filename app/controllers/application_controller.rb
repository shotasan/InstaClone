class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # セッション用のヘルパーモジュールをincludeして全コントローラで使用できるようにする
  include SessionsHelper
end
