class MypagesController < ApplicationController
  add_breadcrumb "フリマ", :root_path
  add_breadcrumb "マイページ", :mypages_path

  def index
    add_breadcrumb "#{current_user.nickname}さん", mypages_path
  end
end
