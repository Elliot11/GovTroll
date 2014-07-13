require 'rails_helper'

RSpec.describe Target, :type => :model do
  let(:target) { Target.new }

  subject { target }

  it { should belong_to :post }

end
