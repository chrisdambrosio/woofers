describe Woofers.Models.Dog, ->
  describe 'expands the sex of a new dog', ->
    it 'for a male', ->
      dog = new Woofers.Models.Dog(sex: 'M')
      expect(dog.get('sex')).toBe('Male')
    it 'for a female', ->
      dog = new Woofers.Models.Dog(sex: 'F')
      expect(dog.get('sex')).toBe('Female')
    it 'for an unknown sex', ->
      dog = new Woofers.Models.Dog(sex: 'U')
      expect(dog.get('sex')).toBe('Unknown')

  describe 'expands the sex of an existing dog', ->
    it 'for a male', ->
      dog = new Woofers.Models.Dog(sex: 'n/a')
      dog.set('sex', 'M')
      expect(dog.get('sex')).toBe('Male')

  describe 'expands the size of a new dog', ->
    it 'for a small dog', ->
      dog = new Woofers.Models.Dog(size: 'S')
      expect(dog.get('size')).toBe('Small')
    it 'for a medium dog', ->
      dog = new Woofers.Models.Dog(size: 'M')
      expect(dog.get('size')).toBe('Medium')
    it 'for a large dog', ->
      dog = new Woofers.Models.Dog(size: 'L')
      expect(dog.get('size')).toBe('Large')

  describe 'expands the size of an existing dog', ->
    it 'for a small dog', ->
      dog = new Woofers.Models.Dog(size: 'n/a')
      dog.set('size', 'S')
      expect(dog.get('size')).toBe('Small')
