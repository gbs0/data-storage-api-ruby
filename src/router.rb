module Router
  module Home
    def self.index
      "HomeController#index"
    end
  end
  module Repository
    def self.create
      "RepositoryController#create"
    end
    
    def self.get
      "RepositoryController#get"
    end
    
    def self.destroy
      "RepositoryController#destroy"
    end
  end
end