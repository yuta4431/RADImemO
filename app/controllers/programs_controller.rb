class ProgramsController < ApplicationController
  before_action :set_program, only: %i[show edit update destroy]
  
  def index
    @q = Program.ransack(params[:q])
    @programs = @q.result(distinct: true).sort_by { |program| [week_day_order(extract_day(program.day)), program.start_time] }
  end

  def new
    @program = Program.new
    @programs = Program.all.order(day: :asc)
    @programs = @programs.sort_by { |program| week_day_order(program.day) }
  end

  def create
    @program = current_user.programs.new(program_params)

    if program_params[:personality_name].present?
      personality_names = program_params[:personality_name].split("/").map(&:strip)
      personalities = personality_names.map { |name| Personality.find_or_create_by!(name: name) }
      @program.personalities = personalities
    end

    if @program.save
      redirect_to programs_path, success: "番組情報を作成しました"
    else
      flash.now[:danger] = "番組情報を作成できませんでした: #{@program.errors.full_messages.join(', ')}"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @program = Program.find(params[:id])
  end

  def edit; end

  def update
    if program_params[:personality_name].present?
      personality_names = program_params[:personality_name].split("/").map(&:strip)
      personalities = personality_names.map { |name| Personality.find_or_create_by!(name: name) }
      @program.personalities = personalities
    end

    if @program.update(program_params)
      redirect_to @program, success: "番組情報を更新しました"
    else
      flash.now[:danger] = "番組情報を更新できませんでした"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @program.destroy!
    redirect_to programs_path, success: "番組情報を削除しました", status: :see_other
  end

  private

  def program_params
    params.require(:program).permit(:title, :personality_name, :channel, :day, :start_time, :end_time)
  end
  
  def set_program
    @program = Program.find(params[:id])
  end

  def extract_day(day)
    day.match(/(月曜日|火曜日|水曜日|木曜日|金曜日|土曜日|日曜日)/)&.to_s
  end

  def week_day_order(day)
    days = %w[月曜日 火曜日 水曜日 木曜日 金曜日 土曜日 日曜日]
    days.index(day) || 0
  end
end
