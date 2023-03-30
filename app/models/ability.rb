class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Recipee, public: true
    can :read, Food
    can(:manage, :all, user:)
    can :read, Recipee, public: true
    can :read, Food
  end
end
