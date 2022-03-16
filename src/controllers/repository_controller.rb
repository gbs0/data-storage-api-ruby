class RepositoryController < AppController
	def get
    repo = $database[params[:name]]
		if repo.nil?
			render "Page not found", 404
		else
			obj = $database[params[:name]][params[:object_id]]
			obj.nil? ? (render "Not found", 404) : (render obj[:data], 200)
		end
  end

	def create
		if @url_params.empty?
		  render "Bad Request", 400
		else
			data = @url_params.map{|key, value| "#{key}#{value}"}.join('&')
			oid = data.tr(" ", "-")
			response = {
					oid: data.tr(" ", "-"),
					size: data.size            
			}
			object = response
			object[:data] = data
			$database[params[:name]] ||= {}
			$database[params[:name]][oid] = object
			render response.to_json, 201, {"Content-Type" => "application/json"}
		end
	end
  
	def destroy
		repo = $database[params[:name]]
		if repo.nil?
			render "Not found", 404
		else
			obj = $database[params[:name]][params[:object_id]]
			if obj.nil? 
				render "Not found", 404
			else
				$database[params[:name]].delete(params[:object_id])
				render "Destroyed", 200
			end
		end		
	end
end