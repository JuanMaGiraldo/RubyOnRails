module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = %w[public private archived].freeze

  def archived?
    status == 'archived'
  end

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end
end
