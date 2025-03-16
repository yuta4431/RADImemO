class SearchController < ApplicationController
  def index
    search_word = params[:q]

    if search_word.blank?
      @no_results = true
      return
    end
    
    @q_programs = Program.ransack(title_or_channel_or_personality_name_cont: search_word)
    @programs_results = @q_programs.result(distinct: true)

    @q_personalities = Personality.ransack(name_or_programs_title_or_programs_channel_cont: search_word)
    @personalities_results = @q_personalities.result(distinct: true)

    @q_posts = Post.ransack(content_or_program_title_cont: search_word)
    @posts_results = @q_posts.result(distinct: true)

    @search_word = search_word
    
    if @programs_results.empty? && @personalities_results.empty? && @posts_results.empty?
      @no_results = true
    end
  end
end