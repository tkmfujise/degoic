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
require 'rails_helper'

RSpec.describe Project, type: :model do
  it_behaves_like 'factory'
end
