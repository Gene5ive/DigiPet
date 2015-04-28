class DigiPet
  @@pet_info = []

  define_method(:initialize) do |name|
    @name = name
    @food_lvl = 10
    @sleep_lvl = 10
    @active_lvl = 10
    @last_update = Time.now.to_i
    @@pet_info=[@name, @food_lvl, @sleep_lvl, @active_level]
  end

  define_singleton_method(:pet_info) do
    @@pet_info
  end

  define_method(:name) do
    "Your DigiPet's name is #{@name}!"

  end

  define_method(:food_lvl) do
    "#{@name}'s food level is at #{@food_lvl}"
  end

  define_method(:feed) do |feed|
    feed = self
    if feed == "feed"
      @food_lvl += 1
      @@pet_info[1] = @food_lvl
      self.update()
      "#{@name} has been fed and has a food level of #{@food_lvl}!"
    end
  end

  define_method(:sleep_lvl) do
    "#{@name}'s sleep level is at #{@sleep_lvl}"
  end

  define_method(:go_sleep) do
    @sleep_lvl += 1
    @@pet_info[2] = @sleep_lvl
    self.update()
    "#{@name} has gone to sleep and has a sleep level of #{@sleep_lvl}!"
  end

  define_method(:active_lvl) do
    "#{@name}'s activity level is at #{@active_lvl}"
  end

  define_method(:play) do
    @active_lvl += 1
    @@pet_info[3] = @active_lvl
    self.update()
    @active_lvl
    "#{@name} has gone out to play and has an activity #{@active_lvl}!"
  end

  define_method(:time_passes) do
    @food_lvl -= @amount || 1
    @sleep_lvl -= @amount || 1
    @active_lvl -= @amount || 1
  end

  define_method(:alive) do
    return (@food_lvl > 0 &&
            @sleep_lvl > 0 &&
            @active_lvl > 0) ? true : false
  end

  define_method(:update) do
    this_update = Time.now.to_i
    @amount = (this_update.-(@last_update))/30
    @amount >= 1 ? self.time_passes : nil
    @last_update = Time.now.to_i
    @amount
    # "#{@amount} half minutes have passed since last update."
  end
  # self.new("Booger")
end
