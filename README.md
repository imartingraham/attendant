# Attendant

A simple ruby wrapper for making Conductor Searchlight API requests. This gem handles making the correct authorization request and returns the results.

Example:

	credentials = {
		email: "testing@example.com",
		secret: "yourSecretKey",
		url: "http://api.conductor.com"
	}

	c = Attendant::SearchLIght.new(config[:email], 	config[:secret], config[:url])

	data = c.send_request "/v2/accounts"

