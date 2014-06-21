require! request
require! cheerio

export function avaliable-titles(url, done)
  err, res, body <- request url
  done err, {count:0, titles:{}} if err
  c = cheerio.load body, {+xmlMode}
  get = (o, q)->
    c o .children q
  layers = c \Contents .find \Layer
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
  done err, result
