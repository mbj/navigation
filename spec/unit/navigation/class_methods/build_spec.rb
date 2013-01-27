require 'spec_helper'

describe Navigation, '.build' do
  let(:object) { described_class }

  subject { object.build(&block) }

  let(:dummy_builder) do
    Class.new do
      def self.run(&block)
        block.call
      end
    end
  end

  before do
    stub_const('Navigation::Builder', dummy_builder)
  end

  let(:block)  { proc { result } }
  let(:result) { mock('Result')  }

  it 'should call Builder' do
    should be(result)
  end
end
