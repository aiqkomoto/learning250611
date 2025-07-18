require 'rails_helper'

RSpec.describe "Musics", type: :request do
  let!(:user) { User.create!(name: "テストユーザー", email: "test@example.com") }

  before do
    allow_any_instance_of(MusicsController).to receive(:current_user).and_return(user)
  end

  describe "POST /musics" do
    it "登録ユーザーで楽曲が作成できる" do
      expect {
        post musics_path, params: { music: { name: "新曲", performer: "テスト演奏者" } }
      }.to change(Music, :count).by(1)
    end
  end
end