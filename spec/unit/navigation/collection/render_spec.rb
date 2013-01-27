require 'spec_helper'

describe Navigation::Collection, '#render' do

  class FakeApplication
    def generate_path(name, params)
      "/#{name}/#{params}"
    end
  end

  # TODO automate this
  this_spec = 'Navigation::Collection#render'

  let(:application) { FakeApplication.new  }
  let(:object)      { described_class.new(items) }

  subject { object.render(application) }

  shared_examples_for this_spec do
    it { should be_a(HTML::Fragment) }
    its(:to_s) { should eql(expected_html) }
  end

  context 'with items' do
    let(:items) do
      [
        Navigation::Item.new(
          :name     => 'foo',
          :label    => 'Foo',
          :params   => '{}',
          :children => Navigation::Collection::EMPTY
        ),
        Navigation::Item.new(
          :name     => 'bar',
          :label    => 'Bar',
          :params   => '{}',
          :children => Navigation::Collection::EMPTY
        )
      ]
    end

    let(:expected_html) do
      '<ul>'                               +
      '<li><a href="/foo/{}">Foo</a></li>' +
      '<li><a href="/bar/{}">Bar</a></li>' +
      '</ul>'
    end

    it_should_behave_like this_spec
  end

  context 'without items' do
    let(:items) { [] }
    
    it { should be(HTML::Fragment::EMPTY) }
  end
end
