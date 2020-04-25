class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    !@user.blank? && @user.admin? 
  end

  def show?
    !@user.blank? && @user.admin?
  end

  def create?
    !@user.blank? && @user.admin?
  end

  def new?
    create?
  end

  def update?
    !@user.blank? && @user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    @user.admin?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
