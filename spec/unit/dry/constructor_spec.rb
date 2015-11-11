RSpec.describe Dry::Constructor do
  let(:instance) { klass.new(one, two, three) }
  let(:one) { double('One') }
  let(:two) { double('Two') }
  let(:three) { double('Three') }

  describe '.()' do
    let(:klass) do
      Class.new do
        include Dry::Constructor(:one, :two, :three)
      end
    end

    it 'assings each constructor arg to an ivar and defines private readers' do
      expect { instance.one }.to raise_error(NoMethodError)
      expect { instance.two }.to raise_error(NoMethodError)
      expect { instance.three }.to raise_error(NoMethodError)
      expect(instance.__send__(:one)).to eq(one)
      expect(instance.__send__(:two)).to eq(two)
      expect(instance.__send__(:three)).to eq(three)
    end
  end

  describe '.Protected()' do
    let(:klass) do
      Class.new do
        include Dry::Constructor::Protected(:one, :two, :three)
      end
    end

    it 'assings each constructor arg to an ivar and defines protected readers' do
      expect { instance.one }.to raise_error(NoMethodError)
      expect { instance.two }.to raise_error(NoMethodError)
      expect { instance.three }.to raise_error(NoMethodError)
      expect(instance.__send__(:one)).to eq(one)
      expect(instance.__send__(:two)).to eq(two)
      expect(instance.__send__(:three)).to eq(three)
    end
  end

  describe '.Public()' do
    let(:klass) do
      Class.new do
        include Dry::Constructor::Public(:one, :two, :three)
      end
    end

    it 'assings each constructor arg to an ivar and defines public readers' do
      expect(instance.one).to eq(one)
      expect(instance.two).to eq(two)
      expect(instance.three).to eq(three)
      expect { instance.one }.to_not raise_error
      expect { instance.two }.to_not raise_error
      expect { instance.three }.to_not raise_error
    end
  end
end
