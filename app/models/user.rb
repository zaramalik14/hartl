# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord

  def microposts
    the_user_id = self.id
    user_posts = Micropost.where({ :user_id => the_user_id})
    return user_posts
  end

end
