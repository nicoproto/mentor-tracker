class UserMentoree < ApplicationRecord
  belongs_to :user
  belongs_to :mentoree
end
