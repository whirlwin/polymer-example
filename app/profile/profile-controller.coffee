class ProfileController

  getProfile: (req, res) ->
    mockProfile =
      name:  'John Doe'
      age:   '20'
      email: 'john.doe@example.org'

    res.send mockProfile

module.exports = new ProfileController()