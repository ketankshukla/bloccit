class FavoriteMailer < ApplicationMailer
  default from: "ketankshukla@gmail.com"

  def new_comment(user, post, comment)

    # #18
    headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
    headers["References"] = "<post/#{post.id}@your-app-name.example>"

    @user = user
    @post = post
    @comment = comment

    # #19
    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(user, post)

    headers["Message-ID"] = "<post/#{post.id}@gmail.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@gmail.com>"
    headers["References"] = "<post/#{post.id}@gmail.com>"

    @user = user
    @post = post


    mail(to: user.email, subject: "You (#{user.name}) are following the post: #{post.title}")
  end
end
