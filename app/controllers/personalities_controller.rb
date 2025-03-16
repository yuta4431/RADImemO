class PersonalitiesController < ApplicationController
  before_action :set_personality, only: %i[show edit update destroy]

  def index
    @q = Personality.ransack(params[:q])
    @personalities = @q.result(distinct: true)
  end
  
  def show
    @personality = Personality.find(params[:id])
  end

  def edit; end

  def update
    if @personality.update(personality_params)
      redirect_to @personality, success: "パーソナリティ名を更新しました"
    else
      flash.now[:danger] = "パーソナリティ名を更新できませんでした"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @personality.destroy!
    redirect_to root_path, success: "パーソナリティを削除しました", status: :see_other
  end

  private

  def personality_params
    params.require(:personality).permit(:name)
  end

  def set_personality
    @personality = Personality.find(params[:id])
  end
end
