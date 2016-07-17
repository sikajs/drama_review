module UsersHelper
  def show_user_comments_count
    if @user.comments_count.nil?
      0
    else
      @user.comments_count
    end
  end
end
