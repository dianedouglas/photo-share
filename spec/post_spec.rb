require 'rails_helper'

describe Post do

  it { should validate_presence_of :image_upload }
  it { should validate_presence_of :description }
  it { should validate_presence_of :user_id }
  it { should have_many :users}

end
