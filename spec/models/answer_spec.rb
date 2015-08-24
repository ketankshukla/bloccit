require 'rails_helper'

RSpec.describe Answer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "attributes" do
    let(:question) { Question.create!(title: "New Post Title", body: "New Post Body", resolved: "Resolved") }
    let(:answer) { Answer.create!(body: 'Comment Body', question: question) }

    it "should respond to body" do
      expect(answer).to respond_to(:body)
    end
  end
end
