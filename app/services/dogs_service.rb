require 'httparty'

class DogsService
  API_KEY = ENV.fetch('RESCUEGROUPS_API_KEY')

  def search(options = {})
    offset = options.fetch(:offset) { 0 }
    limit = options.fetch(:limit) { 20 }

    response = HTTParty.post 'https://api.rescuegroups.org/http/json',
      headers: headers, body: data(offset: offset, limit: limit).to_json
    build_response(response.body)
  end

  def build_response(json)
    api_results = JSON.parse(json)
    {
      'dogs' => api_results['data'].map { |_,animal|
        {
          'id' => animal['animalID'],
          'name' => animal['animalName'],
          'orgId' => animal['animalOrgID'],
          'breed' => animal['animalBreed'],
          'location' => animal['animalLocation'],
          'photos' => animal['animalPictures'],
        }
      },
    }
  end

  def headers
    {
      'Content-Type' => 'application/json',
    }
  end

  def data(options = {})
    {
      apikey: API_KEY,
      objectType: "animals",
      objectAction: "publicSearch",
      search: {
        resultStart: options[:offset],
        resultLimit: options[:limit],
        resultSort: "animalID",
        resultOrder: "asc",
        calcFoundRows: "Yes",
        filters: [
          {
            fieldName: "animalStatus",
            operation: "equals",
            criteria: "Available",
          },
          {
            fieldName: "animalSpecies",
            operation: "equals",
            criteria: "dog",
          },
          {
            fieldName: "animalLocation",
            operation: "equals",
            criteria: "92117",
          },
          {
            fieldName: "animalLocationDistance",
            operation: "radius",
            criteria: "30",
          },
        ],
        fields: [ "animalID","animalOrgID","animalName","animalBreed","animalLocation","animalPictures" ]
      }
    }
  end
end
