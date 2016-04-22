module MoviesNews::MovieModule

  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def create(name)
      self_instance = self.new(name)
      self_instance.save
      self_instance
    end

  end

  module InstanceMethods
    def save
      self.class.all << self
    end
  end
end
