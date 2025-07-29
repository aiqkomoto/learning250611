require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user) { User.create!(name: "テストユーザー", email: "test@example.com") }
  let(:music) { Music.create!(name: "テスト曲", performer: "テスト演奏者", user: user) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe "POST /musics/:music_id/comments" do
    context "正常な内容が送られたとき" do
      it "コメントを追加できる" do
        expect {
          post music_comments_path(music), params: { comment: { content: "素晴らしい曲です！" } }
        }.to change(Comment, :count).by(1)

        expect(response).to redirect_to(music_path(music))
      end
    end

    context "コメント内容が空のとき" do
      it "コメントを追加できない" do
        expect {
          post music_comments_path(music), params: { comment: { content: "" } }
        }.not_to change(Comment, :count)

        expect(response).to redirect_to(music_path(music))
        follow_redirect!
        expect(flash[:alert]).to eq("コメントを入力してください")
      end
    end
  end
end