{mean, sum, id, map, fold, zip, filter, group-by, obj-to-pairs, head, tail, split-at, join, intersection, union, sort} = require 'prelude-ls'
exports = exports ? this

match-score = (as, bs) ->
	(intersection as, bs).length / (union as, bs).length


render-exhibitors = (matched-exhibitors) ->
	d3.select \article .selectAll \div.exhibitor .data matched-exhibitors
		..enter! .append \div .attr \class, \exhibitor
			..append \h2
			..append \div .attr \class, \web-country
				..append \span .attr \class, \web
					..append \a .attr \target, \_blank
				..append \span .attr \class, \country
			..append \div .attr \class, \text
			..append \div .attr \class, \more 
				.append \a
			..append \ul .attr \class, \categories
			..append \div .attr \class, \location
		..exit! .remove!
		..select \h2 .text (.name)
		..select '.web a' .attr \href, (.web) .text (.web)
		..select \.country .text (.country)
		..select \.text .text (.text)
		..select '.more a' .attr \href, (.url) .text 'more...' .attr \target, \_blank
		..select \.categories .selectAll \li .data (.categories)
			..enter! .append \li
			..text id
			..exit! .remove!
		..select \.location .text (.location)

categories <- $.get '/data/categories.json'
exhibitors <- $.get '/data/list.json'

$option = d3.select('#categories').selectAll('option').data(sort categories)
	..enter().append('option')
	..text id .attr 'value', id
	..exit().remove()

$ \#categories .select2({width: 'element', height: 'element', allowClear: true})

$ \#categories .on \change , ->
	selected-categories = $ this .val!
	if !!selected-categories and selected-categories.length > 0 
		matched-exhibitors = filter ((ex)-> (intersection ex.categories, selected-categories).length == selected-categories.length), exhibitors
		console.log matched-exhibitors.length
		render-exhibitors matched-exhibitors



render-exhibitors exhibitors