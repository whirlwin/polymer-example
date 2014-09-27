class IndexController

  index: (req, res) ->
    res.send 'foobar'

module.exports = new IndexController()