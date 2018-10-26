class Ability
  include CanCan::Ability
  def initialize(user)
      if user.admin?
        can :manage, :all
      elsif user.role.eql?("Supervisor")
        can :read, ActiveAdmin::Page, :name => "Dashboard"
        can :create, ActiveAdmin::Comment
        can [:create, :read], Student
        can :manage, Student, user_id: user.id
        can [:create, :read], Teacher
        can :manage, Teacher, user_id: user.id
        can [:create, :read], Parent
        can :manage, Parent, user_id: user.id
        can [:create, :read], Level
        can :manage, Level, user_id: user.id
        can [:create, :read], Type
        can :manage, Payment
        can :manage, Incident
        can :manage, Attendance
        can :manage, Type, user_id: user.id
        can [:show, :read, :update], User, :id => user.id
        can :manage, Wage
        can :manage, Exam
        can :manage, Subject
        can :manage, Category
      elsif user.role.eql?("Teacher")
        can :read, ActiveAdmin::Page, :name => "Dashboard"
        can :create, ActiveAdmin::Comment
        can [:read], Student
        can [:read], Parent
        can [:read], Level
        can :manage, Incident
        can [:show, :read, :update], User, :id => user.id
      else
        can :read, Student
        can :read, Parent
        can [:read, :create], Incident
        can [:read, :update, :create], Attendance
        can :read, ActiveAdmin::Page, :name => "Dashboard"
        can [:show, :read, :update], User, :id => user.id
        can :create, ActiveAdmin::Comment
        can :read, Level
      end
  end
end
