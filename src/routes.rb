class Routes < Router::Mapper
    # ===> 
    # List of all routes definitions
    # 
    get '/', Router::Home.index
    get '/data/:name/:object_id', Router::Repository.get
    put '/data/:name', Router::Repository.create
    delete '/data/:name/:object_id', Router::Repository.destroy
end