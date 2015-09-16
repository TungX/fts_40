class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      cannot :read, :all
      can :manage, Question, user_id: user.id
      can [:create, :show, :index], Exam, user_id: user.id
    end
  end
end
