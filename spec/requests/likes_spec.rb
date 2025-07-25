require 'rails_helper'

RSpec.describe "Likes", type: :request do
  let(:user) { User.create!(name: "テストユーザー", email: "test@example.com") }
  let(:music) { Music.create!(name: "テスト曲", performer: "テスト演奏者", user: user) }

  before do
    # 擬似的にログイン中のユーザーを current_user にする
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe "POST /musics/:music_id/like" do
    it "楽曲にいいねできる" do
      expect {
        post music_like_path(music)
      }.to change(Like, :count).by(1)

      expect(response).to redirect_to(music_path(music))
    end
  end

  describe "DELETE /musics/:music_id/like" do
    before do
      music.likes.create!(user: user)
    end

    it "いいねを解除できる" do
      expect {
        delete music_like_path(music)
      }.to change(Like, :count).by(-1)

      expect(response).to redirect_to(music_path(music))
    end
  end
end