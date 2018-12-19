$(function () {
	getConcerts()
})

function getConcerts() {
	// declared a variable, using javascript to find it with css selectors
	let allConcertsLink = document.querySelector('a#all-concerts')

	// listened for click of that thing, by adding event listener
	allConcertsLink.addEventListener('click', function (event) {

		// upon click, function was exectued, INCLUDING the "event" (click, mouseover....etc)

		// prevents the link from self-executing
		event.preventDefault()

		// ajax request, with object { } passed in
		// the object:  {url: ...., method: ...., dataType: .... }

		// .done ?
		// execute a function using "response" (the data coming from Rails)
		// chrome console, network tab to see response

		$.ajax({
			// url: "http://127.0.0.1:3000/concerts",
			url: this.href,
			method: 'get',
			dataType: 'json'
		}).done(function (response) {
			console.log('response:', response)
			let concert = new Concert(response[0])

			debugger

			// put data onto the DOM
			// JSON cannot go directly onto the DOM, have turn into strings
			let display = document.getElementById('concert-data')
			display.innerHTML = `<h1>${response[0].artist}</h1>`

		})
			.fail(function (error) {
				console.log("error: ", error);
			})
	})
}

class Concert {
	constructor(obj) {
		this.artist = obj.artist
		this.venue = obj.venue
		this.name = obj.name
	}
}

Concert.prototype.printTicket = function () {
	return (`
		<div>${this.artist}</div>
	`)
}