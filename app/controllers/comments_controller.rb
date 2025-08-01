class CommentsController < ApplicationController
  before_action :set_music

  def create
    comment = @music.comments.build(comment_params)
    comment.user = current_user
    if comment.save
      redirect_to @music
    else
      redirect_to @music, alert: "コメントを入力してください"
    end
  end

  def destroy
    comment = @music.comments.find(params[:id])
    if comment.user == current_user
      comment.destroy
      redirect_to @music, notice: "コメントを削除しました"
    else
      redirect_to @music, alert: "削除権限がありません"
    end
  end

  private

  def set_music
    @music = Music.find(params[:music_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end