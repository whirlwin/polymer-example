class IndexController

  index: (req, res) ->
    res.render 'index'

  getExampleJson: (req, res) ->
    res.send foo: 'bar', baz: 'qux'

module.exports = new IndexController()