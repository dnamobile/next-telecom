class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.like(field, value)
    where("#{field} like ?", "%#{value}%")
  end

end
