require 'spec_helper'

module Accrete
  describe 'Star' do
    subject { Star.new 1.0 }

    it 'has mass' do
      expect(subject.mass).not_to eq(nil)
    end

    it 'has a luminosity, which is a float' do
      expect(subject.luminosity).not_to eq(nil)
      expect(subject.luminosity).to be_a(Float)
    end

    context 'Sun' do
      it 'has a specific luminosity' do
        expect(subject.luminosity).to eq(1.0)
      end
    end

    {
      0.079 => nil,
      0.08 => 0.0006,
      0.42 => 0.0312,
      0.43 => 0.0341,
      1.99 => 15.682,
      2.00 => 11.313,
      99.99 => 319_968.0,
      100 => nil
    }.each do |mass, lum|
      context "Star with mass #{mass}" do
        subject { Star.new mass }

        it "has a specific luminosity (#{lum})" do
          if lum.nil?
            expect(subject.luminosity).to eq(nil)
          else
            expect(subject.luminosity).not_to eq(nil)
            expect(subject.luminosity).to be_within(0.001).of(lum)
          end
        end
      end
    end
  end
end
