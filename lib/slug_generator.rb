
module SlugGenerator
  mattr_accessor :implementation

  def self.next
    implementation.call
  end

  module RandomGenerator
    LENGTH = 3

    # This implementation generates a random 6 hex character string which gives
    # us a space for up to 2,821,109,907,456 possible slugs.
    #
    # We choose this implementation over solutions like a bijective conversion
    # of an auto-incrementing integer because we'll assume getting an
    # auto-incrementing counter is difficult (i.e. a sharded database)
    def self.call
      SecureRandom.hex(LENGTH)
    end
  end
end

SlugGenerator.implementation = SlugGenerator::RandomGenerator