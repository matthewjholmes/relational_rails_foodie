class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.order_by_most_recent_creation
    order(created_at: :desc)
  end
end
