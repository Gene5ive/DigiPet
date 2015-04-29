require('rspec')
require('pry')
require('digipet')

describe(DigiPet) do
  describe("#initialize") do
    it("creates new pet and sets life levels") do
      my_pet = DigiPet.new("lil dragon")
      expect(my_pet.name()).to(eq("lil dragon"))
      expect(my_pet.food_lvl()).to(eq("lil dragon's food level is at 10"))
      expect(my_pet.sleep_lvl()).to(eq("lil dragon's sleep level is at 10"))
      expect(my_pet.active_lvl()).to(eq("lil dragon's activity level is at 10"))
    end
  end

  describe("#time_passes") do
    it("descreases the amount of food of the DigiPet has left by 1") do
      my_pet = DigiPet.new("lil dragon")
      my_pet.time_passes()
      expect(my_pet.food_lvl()).to(eq("lil dragon's food level is at 9"))
      expect(my_pet.sleep_lvl()).to(eq("lil dragon's sleep level is at 9"))
      expect(my_pet.active_lvl()).to(eq("lil dragon's activity level is at 9"))
    end
  end

  describe("#alive") do
    it("checks to see if DigitPet levels are above zero") do
      my_pet = DigiPet.new("lil dragon")
      expect(my_pet.alive()).to(eq(true))
    end

    it("checks to see if DigiPet is dead because levels are at zero") do
      my_pet = DigiPet.new("lil dragon")
      10.times { my_pet.time_passes }
      expect(my_pet.alive()).to(eq(false))
    end
  end

    # describe('#update') do
    #   it("down increments each pet level by 1 every 30 seconds") do
    #     my_pet = DigiPet.new("lil dragon")
    #     sleep(30)
    #     expect(my_pet.update()).to(eq(1))
    #   end
    # end

end
