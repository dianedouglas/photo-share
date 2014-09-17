require 'rails_helper'

describe Favorite do

	it { should belong_to :post }
	it { should belong_to :user }
end