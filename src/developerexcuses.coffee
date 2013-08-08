
request = require 'request'

rex = /<a.*?>(.*?)<\/a>/

excuses = (fn) ->
  request.get 'http://developerexcuses.com/', (err, res, body) ->
    return fn 'Oops, sth. is wrong' if err

    match   = rex.exec body
    excuses = if match then match[1] else 'No more excuses'
    fn null, excuses

module.exports = excuses
