class List < ApplicationRecord
    validates :content, {presence:true}
    validates :user_id, {presence:true}
    validates :date, {presence:true}
end
