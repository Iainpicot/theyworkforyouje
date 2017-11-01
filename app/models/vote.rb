class Vote < ApplicationRecord
  belongs_to :politician
  belongs_to :proposition
end 