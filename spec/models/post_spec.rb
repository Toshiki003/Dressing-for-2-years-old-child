require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validation' do    
    it '全ての項目が存在する場合、有効' do 
      post = build(:post)
      expect(post).to be_valid
      expect(post.errors).to be_empty
    end
    it 'titleが未入力の場合、無効' do
      post = build(:post, title: nil)
      expect(post).to be_invalid
      expect(post.errors[:title]).to eq ["を入力してください"]
    end
    it 'titleが255文字の場合、有効' do
      post = build(:post, title: "a" * 255)
      expect(post).to be_valid
      expect(post.errors).to be_empty
    end
    it 'titleが256文字の場合、無効' do
      post = build(:post, title: "a" * 256)
      expect(post).to be_invalid
      expect(post.errors[:title]).to eq ["は255文字以内で入力してください"]
    end
    it 'contentが未入力の場合、無効' do
      post = build(:post, content: nil)
      expect(post).to be_invalid
      expect(post.errors[:content]).to eq ["を入力してください"]
    end
    it 'contentが65535文字の場合、有効' do
      post = build(:post, content: "a" * 65535)
      expect(post).to be_valid
      expect(post.errors).to be_empty
    end
    it 'contentが65536文字の場合、無効' do
      post = build(:post, content: "a" * 65536)
      expect(post).to be_invalid
      expect(post.errors[:content]).to eq ["は65535文字以内で入力してください"]
    end
    it 'embed_youtubeが200文字の場合、有効' do
      post = build(:post, embed_youtube: "a" * 200)
      expect(post).to be_valid
      expect(post.errors).to be_empty
    end
    it 'embed_youtubeが201文字の場合、無効' do
      post = build(:post, embed_youtube: "a" * 201)
      expect(post).to be_invalid
      expect(post.errors[:embed_youtube]).to eq ["は200文字以内で入力してください"]
    end
  end
end
