class LikesController < ApplicationController
  before_action :set_music

  def create
    @music.likes.create(user: current_user)
    redirect_to @music
  end

  def destroy
    @music.likes.find_by(user: current_user)&.destroy
    redirect_to @music
  end

  private

  def set_music
    @music = Music.find(params[:music_id])
  end
end