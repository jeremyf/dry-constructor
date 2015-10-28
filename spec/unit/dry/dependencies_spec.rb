RSpec.describe Dry::Dependencies do
  describe '.dependencies' do
    let(:instance) { klass.new(one, two, three) }
    let(:one) { double('One') }
    let(:two) { double('Two') }
    let(:three) { double('Three') }

    context 'without visibility argument' do
      let(:klass) do
        Class.new do
          include Dry::Dependencies

          dependencies :one, :two, :three
        end
      end

      it 'assings each constructor argument to an instance variable and defines a reader' do
        expect(instance.one).to eq(one)
        expect(instance.two).to eq(two)
        expect(instance.three).to eq(three)
      end
    end

    context 'without visibility argument' do
      let(:klass) do
        Class.new do
          include Dry::Dependencies

          dependencies :one, :two, :three, visibility: :private
        end
      end

      it 'assings each constructor argument to an instance variable and defines a reader' do
        expect { instance.one }.to raise_error(NoMethodError)
        expect { instance.two }.to raise_error(NoMethodError)
        expect { instance.three }.to raise_error(NoMethodError)
        expect(instance.__send__(:one)).to eq(one)
        expect(instance.__send__(:two)).to eq(two)
        expect(instance.__send__(:three)).to eq(three)
      end
    end
  end
end
