class DogsService
  API_KEY = ENV.fetch('PETFINDER_API_KEY')
  API_SECRET = ENV.fetch('PETFINDER_API_SECRET')

  def search(options = {})
    offset = options.fetch(:offset) { 0 }
    limit = options.fetch(:limit) { 20 }

    results = petfinder.find_pets \
      'dog', 'San Diego, CA', count: limit, offset: offset

    build_response(results)
  end

  private

  def build_response(results)
    {
      'dogs' => results.map { |dog|
        {
          'id' => dog.id,
          'name' => dog.name,
          'breeds' => dog.breeds,
          'photos' => dog.photos,
          'sex' => dog.sex,
          'age' => dog.age,
          'size' => dog.size,
          'contact' => parse_contact(dog.contact),
        }
      },
    }
  end

  def petfinder
    @petfinder ||= Petfinder::Client.new(API_KEY, API_SECRET)
  end

  def parse_contact(raw_contact)
    contact_items = raw_contact.
      strip.
      split("\n").
      map { |s| s.strip }

    {
      address1: contact_items[0],
      address2: contact_items[1],
      city: contact_items[2],
      state: contact_items[3],
      zipcode: contact_items[4],
      phone: contact_items[5],
      fax: contact_items[6],
      email: contact_items[7],
    }
  end
end
