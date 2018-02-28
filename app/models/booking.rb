class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user


  def nice_date
   date.strftime("%b %d, %Y")
  end

end
