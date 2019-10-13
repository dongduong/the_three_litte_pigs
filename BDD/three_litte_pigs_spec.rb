require_relative './three_litte_pigs'
require 'minitest/autorun'

describe 'The Three Litte Pigs Story' do
  before(:all) do
    @wolf = Wolf.new
    @first_litte_pig = Pig.new('first_litte_pig')
    @second_litte_pig = Pig.new('second_litte_pig')
    @third_litte_pig = Pig.new('third litte pig')
  end

  describe 'First litte pig build house' do
    before(:all) do
      @straw_house = @first_litte_pig.build_house
    end

    it 'house material is straw' do
      @straw_house.material.must_be_instance_of Straw
    end

    describe 'wolf attack' do
      describe 'wolf blow with wind power 1' do
        it 'straw house is destroyed' do
          @straw_house.destroy?(@wolf.blow).must_equal true
        end
      end
    end
  end

  describe 'Second litte pig build house' do
    before(:all) do
      @stick_house = @second_litte_pig.build_house
    end

    it 'house material is stick' do
      @stick_house.material.must_be_instance_of Stick
    end

    describe 'wolf attack' do
      describe 'wolf blow with wind power 1' do
        it 'stick house is not destroyed' do
          @stick_house.destroy?(@wolf.blow).must_equal false
        end
      end

      describe 'wolf blow with wind power 2' do
        it 'stick house is destroyed' do
          @stick_house.destroy?(@wolf.blow(2)).must_equal true
        end
      end
    end
  end

  describe 'Third litte pig build house' do
    before(:all) { @brick_house = @third_litte_pig.build_house }

    it 'house material is brick' do
      @brick_house.material.must_be_instance_of Brick
    end

    describe 'wolf attack' do
      describe 'wolf blow with wind power 1' do
        it 'brick house is not destroyed' do
          @brick_house.destroy?(@wolf.blow).must_equal false
        end
      end

      describe 'wolf blow with wind power 2' do
        it 'brick house is not destroyed' do
          @brick_house.destroy?(@wolf.blow(2)).must_equal false
        end
      end

      describe 'wolf blow with wind power 3' do
        it 'brick house is not destroyed' do
          @brick_house.destroy?(@wolf.blow(3)).must_equal false
        end
      end
    end
  end
end