$(document).ready(function () {
	$("#ask-list-items li").click(function(e) {
		var id = $(e.currentTarget).attr("id");
		$("button#"+id+"-done").toggleClass("hidden");
		e.preventDefault();
	});
});