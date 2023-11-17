# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # Guest user (not logged in)
    return unless user.present?

    can :read, :all
    can :create, [Comment, Post]

    # User can destroy their own posts and comments
    can :destroy, Post, author: user.id
    can :destroy, Comment, user: user.id

    # Admins can delete any post or comment
    can :destroy, Post, author: user.id, role: 'admin'
    can :destroy, Comment, user: user.id, role: 'admin'
  end
end
