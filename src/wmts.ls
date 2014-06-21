require! request
require! cheerio

export function avaliable-titles(url, done)
  err, res, body <- request url
  $ = cheerio.load body, {+xmlMode}
  get = (o, q)->
    $ o .children q
  layers = $ \Layer
  result = {count: layers.length, titles: {}}
  layers.each (idx)->
    id = get @, "ows\\:Identifier" .text!
    name = get @, "ows\\:Title" .text!
    format = get @, \Format .text! .replace 'image/', ''
    url = get @, \ResourceURL .attr \template
    result['titles'][id] = do
      id: id
      name: name
      format: format
      url: url
  done result
