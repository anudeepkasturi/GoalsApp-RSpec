# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  details    :text
#  visibility :string           default("Public")
#  finished?  :string           default("Ongoing")
#  cheers     :integer
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :goal do
    title "MyString"
    details "MyText"
    visibility "MyString"
    finished? "MyString"
    cheers 1
  end
end
