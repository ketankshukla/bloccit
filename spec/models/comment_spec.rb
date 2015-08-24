require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "attributes" do
    let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }
    let(:comment) { Comment.create!(body: 'Comment Body', post: post) }

    it "should respond to body" do
      expect(comment).to respond_to(:body)
    end
  end

end
