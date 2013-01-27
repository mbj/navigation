require 'spec_helper'

describe Navigation::Builder, '.run' do
  let(:object) { described_class }

  subject do 
    object.run do |nav|
      nav.item(:foo, 'Foo')
    end
  end

  it 'should return item collection' do
    should eql(
      Navigation::Collection.new([
        Navigation::Item.new(
          :name => :foo,
          :label => 'Foo',
          :params => {},
          :children => Navigation::Collection::EMPTY
        )
      ])
    )
  end
end
