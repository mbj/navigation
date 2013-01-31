require 'spec_helper'

describe Navigation::Item, '#render' do

  class FakeApplication
    def generate_path(name, params)
      "/#{name}/#{params}"
    end
  end

  # TODO automate this
  this_spec = 'Navigation::Item#render'

  let(:application) { FakeApplication.new  }
  let(:object)      { described_class.new(attributes) }

  subject { object.render(application) }

  shared_examples_for this_spec do
    it { should be_a(HTML::Fragment) }
    its(:to_s) { should eql(expected_html) }
  end

  context 'without children' do
    let(:attributes) do
      {
        :name     => 'foo',
        :label    => 'Foo',
        :params   => '{}',
        :children => Navigation::Collection::EMPTY
      }
    end

    let(:expected_html) do
      '<a href="/foo/{}">Foo</a>'
    end

    it_should_behave_like this_spec
  end

  context 'with chidren' do
    let(:attributes) do
      {
        :name     => 'foo',
        :label    => 'Foo',
        :params   => '{}',
        :children => Navigation::Collection.new(children)
      }
    end

    let(:children) do
      [
        Navigation::Item.new(
          :name     => 'bar',
          :label    => 'Bar',
          :params   => '{}',
          :children => Navigation::Collection::EMPTY
        ),
        Navigation::Item.new(
          :name     => 'baz',
          :label    => 'Baz',
          :params   => '{}',
          :children => Navigation::Collection::EMPTY
        )
      ]
    end

    let(:expected_html) do
      '<a href="/foo/{}">Foo</a>'            +
      '<ul>'                                 +
        '<li><a href="/bar/{}">Bar</a></li>' +
        '<li><a href="/baz/{}">Baz</a></li>' +
      '</ul>'
    end

    it_should_behave_like this_spec
  end
end

