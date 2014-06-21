expect = chai.expect
describe 'leaflet-tw', ->
  describe 'is compatable with WMTS.', -> ``it``
    .. 'sould able to get avaliable titles.', (done) ->
      titles <- avaliable-titles \http://gis.sinica.edu.tw/tainan/wmts//1.0.0/WMTSCapabilities.xml
      expect titles.tainan_1875 .to.deep.equal do
        name: '臺灣府城街道圖'
      done!
