module DramasHelper
  def is_drama_owner?(user)
    user_signed_in? && (@drama.user == user)
  end
end
