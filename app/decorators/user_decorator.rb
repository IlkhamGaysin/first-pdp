class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :avatar, :avatar_attacher

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end
end
