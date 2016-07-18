module UsersHelper
  def show_user_comments_count(user)
    if user.comments_count.nil?
      0
    else
      user.comments_count.to_i
    end
  end
end
