class MypagesController < ApplicationController
  before_action :set_breadcrumb
  before_action :set_breadcrumb_index, only: [:index]

  def index
  end

  private

  def set_breadcrumb
    add_breadcrumb "フリマ", :root_path
    add_breadcrumb "マイページ", :mypages_path
  end

  def set_breadcrumb_index
    add_breadcrumb "#{current_user.nickname}さん", mypages_path
  end
end