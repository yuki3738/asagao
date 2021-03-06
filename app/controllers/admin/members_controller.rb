class Admin::MembersController < Admin::Base

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

  def new
    @member = Member.new(birthday: Date.new(1985, 1, 1))
    @member.build_image
  end

  def edit
    @member = Member.find(params[:id])
    @member.build_image unless @member.image
  end

  def create
    @member = Member.new(params[:member], as: :admin)
    if @member.save
      redirect_to [:admin, @member], notice: "会員を登録しました。"
    else
      render "new"
    end
  end

  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(params[:member], as: :admin)
    if @member.save
      redirect_to [:admin, @member], notice: "会員情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :admin_members, notice: "会員を削除しました。"
  end
end
