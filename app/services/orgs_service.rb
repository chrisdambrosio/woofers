require 'httparty'

class OrgsService
  API_KEY = ENV.fetch('RESCUEGROUPS_API_KEY')

  def show(id)
    response = HTTParty.post 'https://api.rescuegroups.org/http/json',
      headers: headers, body: data(id: id).to_json
    build_response(response.body)
  end

  def build_response(json)
    api_results = JSON.parse(json)
    org = api_results['data'].first

    {
      'id' => org['orgID'],
      'name' => org['orgName'],
      'city' => org['orgCity'],
      'state' => org['orgState'],
      'address' => org['orgAddress'],
      'postalCode' => org['orgPostalcode'],
      'phone' => org['orgPhone'],
      'email' => org['orgEmail'],
      'website' => org['orgWebsiteUrl'],
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
      objectType: "orgs",
      objectAction: "publicView",
      values: [
        { orgID: options[:id] }
      ],
      fields: %W{orgID orgName orgCity orgState orgAddress orgPostalcode
                 orgPhone orgEmail orgWebsiteUrl}
    }
  end
end
