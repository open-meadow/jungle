class Sale < ApplicationRecord

  # ActiveRecord Scope
  scope :active, -> { where(
    # SQL condition
    "sales.starts_on <= ? AND sales.ends_on >= ?",
    # Parameters 
    Date.current, Date.current
  )}

  # def self.active
  #   where(
  #     # SQL condition
  #     "sales.starts_on <= ? AND sales.ends_on >= ?",
  #     # Parameters 
  #     Date.current, Date.current
  #   )
  # end

  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming && !finished
  end

end
