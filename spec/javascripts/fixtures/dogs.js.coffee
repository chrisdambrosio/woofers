beforeEach ->
  @fixtures =
    dogs:
      bit:
        id: "27542149",
        name: "Bit",
        breeds: [
          "Pit Bull Terrier",
          "American Bulldog"
        ],
        photos: [
          {
            id: "1",
            thumbnail: "http://photos.petfinder.com/photos/pets/27542148/3/?bust=1381609467&width=60&-pnt.jpg",
            small: "http://photos.petfinder.com/photos/pets/27542148/3/?bust=1381609467&width=95&-fpm.jpg",
            large: "http://photos.petfinder.com/photos/pets/27542148/3/?bust=1381609467&width=500&-x.jpg",
            medium: "http://photos.petfinder.com/photos/pets/27542148/3/?bust=1381609467&width=300&-pn.jpg",
            tiny: "http://photos.petfinder.com/photos/pets/27542148/3/?bust=1381609467&width=50&-t.jpg"
          },
          {
            id: "2",
            thumbnail: "http://photos.petfinder.com/photos/pets/27542148/2/?bust=1381609478&width=60&-pnt.jpg",
            small: "http://photos.petfinder.com/photos/pets/27542148/2/?bust=1381609478&width=95&-fpm.jpg",
            large: "http://photos.petfinder.com/photos/pets/27542148/2/?bust=1381609478&width=500&-x.jpg",
            medium: "http://photos.petfinder.com/photos/pets/27542148/2/?bust=1381609478&width=300&-pn.jpg",
            tiny: "http://photos.petfinder.com/photos/pets/27542148/2/?bust=1381609478&width=50&-t.jpg"
          }
        ],
        sex: "F",
        age: "Young",
        size: "M",
        contact:
          address1: "P.O. Box 720008",
          address2: "",
          city: "San Diego",
          state: "CA",
          zipcode: "92172",
          phone: "(858) 220-7546",
          fax: "858 513-0075",
          email: "info@itsthepits.org"
      byte:
        id: "27542148",
        name: "Byte",
        breeds: [
          "Pointer",
          "Terrier"
        ],
        photos: [
          {
            id: "1",
            thumbnail: "http://photos.petfinder.com/photos/pets/27542148/3/?bust=1381609467&width=60&-pnt.jpg",
            small: "http://photos.petfinder.com/photos/pets/27542148/3/?bust=1381609467&width=95&-fpm.jpg",
            large: "http://photos.petfinder.com/photos/pets/27542148/3/?bust=1381609467&width=500&-x.jpg",
            medium: "http://photos.petfinder.com/photos/pets/27542148/3/?bust=1381609467&width=300&-pn.jpg",
            tiny: "http://photos.petfinder.com/photos/pets/27542148/3/?bust=1381609467&width=50&-t.jpg"
          },
          {
            id: "2",
            thumbnail: "http://photos.petfinder.com/photos/pets/27542148/2/?bust=1381609478&width=60&-pnt.jpg",
            small: "http://photos.petfinder.com/photos/pets/27542148/2/?bust=1381609478&width=95&-fpm.jpg",
            large: "http://photos.petfinder.com/photos/pets/27542148/2/?bust=1381609478&width=500&-x.jpg",
            medium: "http://photos.petfinder.com/photos/pets/27542148/2/?bust=1381609478&width=300&-pn.jpg",
            tiny: "http://photos.petfinder.com/photos/pets/27542148/2/?bust=1381609478&width=50&-t.jpg"
          }
        ],
        sex: "M",
        age: "Young",
        size: "L",
        contact:
          address1: "P.O. Box 720008",
          address2: "",
          city: "San Diego",
          state: "CA",
          zipcode: "92172",
          phone: "(858) 220-7546",
          fax: "858 513-0075",
          email: "info@itsthepits.org"

  @fixtures.Dogs =
    valid:
      dogs: [
        @fixtures.dogs['bit']
        @fixtures.dogs['byte']
      ]
