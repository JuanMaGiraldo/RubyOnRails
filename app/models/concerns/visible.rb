module Visible

  #Validations are methods called at the class level
  #this extend give us a simpler way to include them.

  extend ActiveSupport::Concern

  VALID_STATUSES = ['public','private','archived']
  
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