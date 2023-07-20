# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    return unless user.present?

    can :manage, Category, author_id: user.id
    can :manage, Deal, author_id: user.id
  end
end
