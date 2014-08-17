class EntriesController < ApplicationController
    before_filter :login_required, except: [:index, :show]

  def index
    if params[:member_id]
      @member = Member.find(params[:member_id])
      rel = @member.entries
    else
      rel = Entry
    end
    @entries = rel.readable_for(@current_member).
                 order("posted_at DESC").page(params[:page]).per(5)
  end

  def show
    @entry = Entry.readable_for(@current_member).find(params[:id])
  end

  def new
    @entry = Entry.new(posted_at: Time.current)
  end

  # 編集フォーム
  def edit
    @entry = @current_member.entries.find(params[:id])
  end
end
