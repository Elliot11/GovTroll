require 'rails_helper'

RSpec.describe Contact, :type => :model do
  let(:contact) { Contact.new }

  subject { contact }

  it { should respond_to :first_name }
  it { should respond_to :last_name }
  it { should respond_to :email }
  it { should respond_to :twitter }
  it { should respond_to :facebook }

end
