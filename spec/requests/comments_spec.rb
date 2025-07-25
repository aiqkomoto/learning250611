require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user) { User.create!(name: "テストユーザー", email: "test@example.com") }
  let(:music) { Music.create!(name: "テスト曲", performer: "テスト演奏者", user: user) }

  before do
    # current_user を仮に上書き
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe "POST /musics/:music_id/comments" do
    it "コメントを追加できる" do
      expect {
        post music_comments_path(music), params: { comment: { content: "素晴らしい曲です！" } }
      }.to change(Comment, :count).by(1)
      
      expect(response).to redirect_to(music_path(music))
    end
  end

  describe "DELETE /musics/:music_id/comments/:id" do
    it "コメントを削除できる" do
      comment = music.comments.create!(content: "削除対象コメント", user: user)

      expect {
        delete music_comment_path(music, comment)
      }.to change(Comment, :count).by(-1)

      expect(response).to redirect_to(music_path(music))
    end
  end
end