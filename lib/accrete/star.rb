module Accrete
  class Star
    attr_reader :mass

    SOLAR_MASS = 1.0
    MAX_MASS = 100 # in solar masses M
    MIN_MASS = 0.08 # in solar masses M

    def initialize(mass = 1.0) # in solar masses M
      @mass = mass
    end

    # returns the luminosity of a star in solar luminosities L
    # http://en.wikipedia.org/wiki/Mass%E2%80%93luminosity_relation
    # Only valid for stars with mass > 0.08 M and mass < 100 M
    # -> Only valid for main sequence stars
    def luminosity
      case @mass
      when MIN_MASS...0.43
        0.23 * (@mass / SOLAR_MASS)**2.3
      when 0.43...2.0
        (@mass / SOLAR_MASS)**4
      when 2.0...20.0
        (@mass / SOLAR_MASS)**3.5
      when 20.0...MAX_MASS
        3200 * (@mass / SOLAR_MASS)
      end
    end
  end
end
