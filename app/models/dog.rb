class Dog
  class << self
    def search
      dogs_service.search
    end

    private

    def dogs_service
      DogsService.new
    end
  end
end
