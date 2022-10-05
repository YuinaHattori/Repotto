class Check < ApplicationRecord
    validates :report_id, {presence: true}
    validates :user_id, {presence: true}
end
