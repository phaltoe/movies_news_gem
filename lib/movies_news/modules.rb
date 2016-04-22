module MovieModule

  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def create(name)
      self_instance = self.new(name)
      self_instance.save
      self_instance
    end

    def self.find_by_name(name)
      self.all.detect { |x| x.name == name }
    end

    def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
  end
end
