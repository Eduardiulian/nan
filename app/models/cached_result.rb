class CachedResult < ApplicationRecord
  validates :input, presence: true, uniqueness: true, format: { with: /[0-9 -]/, message: 'not valid list of integers' }
  validates :result, presence: true
end
