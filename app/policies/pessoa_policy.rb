class PessoaPolicy < ApplicationPolicy
  
  def show?
    @pessoa.user.blank?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
