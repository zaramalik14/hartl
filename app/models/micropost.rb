# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Micropost < ApplicationRecord
  validates :content, length: { maximum: 140}, presence:true

  def user
    the_user_id = self.user_id
    the_user = User.where({ :id => the_user_id}).at(0)
    return the_user
  end

end
