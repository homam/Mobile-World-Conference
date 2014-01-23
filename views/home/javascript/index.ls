{mean, sum, id, map, fold, zip, filter, group-by, obj-to-pairs, head, tail, split-at, join} = require 'prelude-ls'
exports = exports ? this

categories <- $.get '/data/categories.json'

$option = d3.select('#categories').selectAll('option').data(categories)
$option.enter().append('option')
$option.text id .attr 'value', id
$option.exit().remove()

$ \#categories .select2({width: 'element', height: 'element', allowClear: true})

$ \#categories .on \change , ->
	console.log $ this