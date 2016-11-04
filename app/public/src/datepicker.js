$(document).ready(function() {
	var dates;

	$.get({
		dataType: 'json',
		url: '/requests/disabled_dates',
		success: function(response) {

			dates = response.disabledDates;

			$("#datepicker").datepicker({
				dateFormat: 'dd-M-y',
		  	beforeShowDay: function(date) {
		    	var string = jQuery.datepicker.formatDate('dd-M-y', date);
					return [dates.indexOf(string) >= 0];
		  	},
				onSelect: function(){
					$('#request_date').prop('disabled', false);
				}
			});
		}
	});

	$('#request_date').click(function() {
		$('#hidden_input').attr('value', $('#datepicker').val());
	});
});

// Stack Overflow code below
//
// var array = ["2013-03-14","2013-03-15","2013-03-16"]
//
// $('input').datepicker({
//     beforeShowDay: function(date){
//         var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
//         return [ array.indexOf(string) == -1 ]
//     }
// });
