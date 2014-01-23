{id, Obj,map, concat, filter, each, find, fold, foldr, fold1, tail, all, take, flatten, sum, group-by, obj-to-pairs, partition, join, unique, sort-by, reverse, head, empty} = require 'prelude-ls'
fs = require 'fs'

save-asjson = (data, filename, callback) ->
	err <- fs.writeFile filename, (JSON.stringify data, null, 4)
	if err
		throw err
	callback!



data = require './ex.json'

categories = (map (.subcategories) >> map (.name)) data |> flatten >> unique >> filter (!='--Select--')

_ <- save-asjson categories, './categories.json'

mdata = map (->
	name: it.name
	web: it.contact.www
	email: it.contact.email
	country: it.address?.country?.name
	text: it.fullDescription
	location: it.locations[0]?.name
	categories: map (.name), it.subcategories
	url: it.shareUrl

), data

_ <- save-asjson mdata, './list.json'

