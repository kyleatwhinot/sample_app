$(document).ready(function () {

	$("#list a").click(function(e) {
		var id = $(e.currentTarget).attr("id");
		$("div#edit_due_at_"+id).toggleClass("hidden");
		$("span.due_"+id).toggleClass("hidden");
		$(this).addClass("hidden");
		e.preventDefault();
	});

		//set up even delegation
		//set up even delegation
	$("#list") //listen for clicks on the li tag
		.on("click", "li", function(e) {
			//show "mark as done" button
		$(e.currentTarget).find("input.done_btn").toggleClass("hidden");
	});

	$("#fulist") //listen for clicks on the li tag
		.on("click", "li", function(e) {
			//show "mark as done" button
		$(e.currentTarget).find("input.done_btn").toggleClass("hidden");
	});

	$(function() {
   		$('.alert').delay(500).fadeIn('normal', function() {
      		$(this).delay(2500).fadeOut('slow');
   		});
   	})
});