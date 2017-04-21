class Delivery < ApplicationRecord
  belongs_to :order
  def checked
    if self.name == "Lettre suivie"
      "checked='checked'"
    else
      ""
    end
  end

end
