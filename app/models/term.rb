class Term < ApplicationRecord
  belongs_to :office
  belongs_to :parish
  belongs_to :politician
end