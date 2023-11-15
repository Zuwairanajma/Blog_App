# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    can :read, :all
    can :create, [Comment, Post]

    # User can destroy their own posts and comments
    can :destroy, Post, user_id: user.id
    can :destroy, Comment, user_id: user.id

    # Admins can delete any post or comment
    can :destroy, Post, user_id: user.id, role: 'admin'
    can :destroy, Comment, user_id: user.id, role: 'admin'
  end
end
