module AdminHelper
  def last_login_text(user)
   user.last_sign_in_at ? time_ago_in_words(user.last_sign_in_at) : "N/A"
 end
end
