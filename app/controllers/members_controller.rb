class MembersController < ApplicationController
  before_filter :login_required

  def index
    @members = Member.page(params[:page]).per(5)
  end

  def search
    @members = Member.search(params[:q])
    render "index"
  end

  def show
    @member = Member.find(params[:id])
  end
end
