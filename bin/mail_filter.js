#!/usr/bin/env node

var text = require('fs').readFileSync('/dev/stdin', 'utf8')

var filters = require('./mail-filters')

var hits = filters.some((fn) => {
  return fn(text)
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
