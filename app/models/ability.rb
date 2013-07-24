class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.is?(:admin)
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities

    if user.is?(:admin)
        can :manage, :all
        cannot :destroy, Profile
        cannot :destroy, User
    elsif user.is?(:manager)
        can :manage, User, id: user
        can :manage, Museum, manager: user.profile
        can :create, Museum
        # can :manage, Exhibit do |exhibit|
        #   exhibit.museum.manager == user.profile
        # end
        can :create, Exhibit do |exhibit|
            exhibit.museum.try(:manager) == user.profile_id
        end
        can :manage, Exhibit do |exhibit|
            exhibit.museum.try(:manager) == user.profile 
        end
        # can :read, Exhibit do |exhibit|
        #     exhibit.museum.try(:manager) == user.profile_id 
        # end
        cannot :manage, Achievement
        cannot :manage, Comment
        cannot :manage, Rating
        cannot :manage, Profile
    else
        can :read, Achievement
        can :manage, User, id: user
        can :read, Museum
        can :read, Exhibit, private: 0
        cannot :manage, Museum
        cannot :manage, Exhibit 
        cannot :create, Achievement
        cannot :destroy, Achievement
        cannot :update, Achievement
        cannot :manage, Comment
        cannot :manage, Rating
        cannot :manage, Profile
    end

  end
end
