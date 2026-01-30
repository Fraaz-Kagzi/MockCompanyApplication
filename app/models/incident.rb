class Incident < ApplicationRecord
  belongs_to :reported_by, class_name: "User"
  belongs_to :job, optional: true

  enum :severity, { low: 0, medium: 1, high: 2, critical: 3 }
  enum :status, { open: 0, investigating: 1, resolved: 2, closed: 3 }
end
