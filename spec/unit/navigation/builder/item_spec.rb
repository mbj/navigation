require 'spec_helper'

describe Navigation::Builder, '#item' do
  let(:object) { described_class.new }

  subject { object.item(*arguments, &block) }

  context 'with default params' do
    let(:arguments) { [name, label] }

    let(:name)  { :foo  }
    let(:label) { 'Bar' }
    let(:block) { nil   }

    it 'should default to empty params' do
      subject
      object.items.last.params.should eql({})
    end
  end

  context 'without block' do
    let(:arguments) { [name, label, params] }

    let(:name)   { :foo             }
    let(:label)  { 'Foo'            }
    let(:params) { { :foo => :bar } }
    let(:block)  { nil              }

    its(:items) do 
      should eql(
        [
          Navigation::Item.new(
            :name     => :foo, 
            :label    => 'Foo', 
            :params   => { :foo => :bar }, 
            :children => Navigation::Collection::EMPTY
          )
        ]
      )
    end
  end

  context 'with block' do
    let(:arguments) { [name, label, params] }

    let(:name)   { :foo  }
    let(:label)  { 'Foo' }
    let(:params) { {}    }
    let(:block) do
      lambda do |nav|
        nav.item(:bar, 'Bar', {})
      end
    end

    its(:items) do 
      should eql(
        [
          Navigation::Item.new(
            :name     => :foo, 
            :label    => 'Foo', 
            :params   => {}, 
            :children => Navigation::Collection.new([
              Navigation::Item.new(
                :name     => :bar, 
                :label    => 'Bar', 
                :params   => {}, 
                :children => Navigation::Collection::EMPTY
              )
            ])
          )
        ]
      )
    end
  end
end
