# == Schema Information
#
# Table name: places
#
#  id             :integer          not null, primary key
#  address        :string
#  datetime_end   :datetime
#  datetime_start :datetime
#  description    :text
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#

class Place < ApplicationRecord
  belongs_to :owner, :class_name => "User" 
end
