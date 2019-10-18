#!/usr/bin/env node

var text = require('fs').readFileSync('/dev/stdin', 'utf8')

var filters = require('./mail_filters.js')

var hits = filters.some(regex => {
  return regex.test(text)
})

if (hits) {
  log(text)
  process.exit(99)
} else {
  process.stdout.write(text)
  process.exit(0)
}

function log (txt) {
  require('fs').appendFileSync('/home/sww/Mail/eight45/filtered.log', txt, 'utf8')
}
