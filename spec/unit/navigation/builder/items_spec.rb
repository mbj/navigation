require 'spec_helper'

describe Navigation::Builder, '#items' do
  let(:object) { described_class.new }
  subject { object.items }

  context 'without items' do
    it { should eql([]) }
  end

  context 'when items where added' do
    before do
      object.item(:foo, 'Foo', {})
    end

    it 'should return expected items' do 
      should eql(
        [
          Navigation::Item.new(
            :name     => :foo, 
            :label    => 'Foo', 
            :params   => {}, 
            :children => Navigation::Collection::EMPTY
          )
         ]
       )
    end
  end
end
