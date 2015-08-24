include RandomData

# Create Posts
50.times do
  # #1
  Post.create!(
      # #2
      title:  RandomData.random_sentence,
      body:   RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
# #3
100.times do
  Comment.create!(
      # #4
      post: posts.sample,
      body: RandomData.random_paragraph
  )
end

#Asssignment 30
#Search by title. If title is not found, then create record with title and body
Post.find_or_create_by(title: "This is a unique title") do |post|
  post.body = "This is a unique body text"
end
#If the comment doesn't exist, insert it and assign the incremented post_id to
#the comment table.
Comment.find_or_create_by(body: "This is a unique comment body") do |comment|
  comment.post_id = Post.count + 1
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

