class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is_admin?
        can :manage, :all
    else
        can :read, :all
    end

    can :manage, [Snippet, Favourite, Profile, Comment] do |u|
        u.user == user
    end
  end
end
