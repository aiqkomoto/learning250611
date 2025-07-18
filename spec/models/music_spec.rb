require 'rails_helper'

RSpec.describe Music, type: :model do
  let(:user) { User.create!(name: "テストユーザー", email: "test@example.com") }

  it "is valid with a performer" do
    music = Music.new(name: "テスト1", performer: "a", user: user)
    expect(music).to be_valid
  end

  it "is invalid without a performer" do
    music = Music.new(name: "テスト2", performer: " ", user: user)
    expect(music).not_to be_valid
  end

  it "is invalid without a user" do
    music = Music.new(name: "テスト3", performer: "演奏者")
    expect(music).not_to be_valid
  end
end