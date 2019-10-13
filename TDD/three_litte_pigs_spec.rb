require_relative './three_litte_pigs'
require 'minitest/autorun'

describe Material do
  describe Straw do
    before { @straw = Straw.new }
    describe '#wind_resistance_ability' do
      it 'must return to 1' do
        @straw.wind_resistance_ability.must_equal 1
      end
    end
  end

  describe Stick do
    before { @stick = Stick.new }
    describe '#wind_resistance_ability' do
      it 'must return to 2' do
        @stick.wind_resistance_ability.must_equal 2
      end
    end
  end

  describe Brick do
    before { @brick = Brick.new }
    describe '#wind_resistance_ability' do
      it 'must return to 999' do
        @brick.wind_resistance_ability.must_equal 999
      end
    end
  end
end

describe House do
  describe 'Straw House' do
    before(:all) { @house = House.new(Straw.new) }

    describe '#material' do
      it 'return Straw object' do
        @house.material.must_be_instance_of Straw
      end
    end

    describe '#destroy?' do
      describe 'Wind power 1' do
        it 'return true' do
          @house.destroy?.must_equal true
        end
      end
    end
  end

  describe 'Stick House' do
    before(:all) { @nhà = House.new(Stick.new) }

    describe '#material' do
      it 'return Stick obect' do
        @house.material.must_be_instance_of Stick
      end
    end

    describe '#destroy?' do
      describe 'Wind power 1' do
        it 'return false' do
          @house.destroy?.must_equal false
        end
      end

      describe 'Wind power 2' do
        it 'return true' do
          @house.destroy?(2).must_equal true
        end
      end
    end
  end

  describe 'Brick House' do
    before(:all) { @house = House.new(Brick.new) }

    describe '#material' do
      it 'return Brick object' do
        @house.material.must_be_instance_of Brick
      end
    end

    describe '#destroy?' do
      describe 'Wind power 1' do
        it 'return false' do
          @house.destroy?.must_equal false
        end
      end

      describe 'Wind power 2' do
        it 'return false' do
          @house.destroy?(2).must_equal false
        end
      end

      describe 'Wind power 3' do
        it 'return false' do
          @house.destroy?(3).must_equal false
        end
      end
    end
  end
end