# Display a picture of Michael Jordan if anyone invokes "jordan" or says "23"
# Cause Jordan is God. So much more than Steve Jobs :D 

Select     = require("soupselect").select
HtmlParser = require "htmlparser"

module.exports = (robot) ->
  robot.hear /http:\/\/p.wbno.de\/(.*)/i, (msg) ->
    msg.http(msg).get() (err, res, body) ->
      handler = new HtmlParser.DefaultHandler()
      parser  = new HtmlParser.Parser handler
      parser.parseComplete body
      
      contentEl = Select handler.dom, "a.embed"
      if contentEl
        msg.send contentEl.attribs.href
      else
        msg.send "No luck, buddy"
      
