# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_projects_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :project do
    sequence(:name){|n| "Project-#{n}" }
  end
end
