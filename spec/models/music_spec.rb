require 'rails_helper'

RSpec.describe Music, type: :model do
  it "is invalid with a performer" do
    music = Music.new(name: "テスト1", performer: "a")
    expect(music).to be_valid
  end

  it "is valid without a performer" do
    music = Music.new(name: "テスト2", performer: " ")
    expect(music).not_to be_valid
  end
end