$(function() {
	var dates;

	$.ajax({
		type: 'get',
		dataType: 'JSONP',
		url: '/requests/available_dates',
		success: function(response) {

			dates = response.availableDates;

			$(".datepicker").datepicker({
				dateFormat: 'dd/mm/yy',
		  	beforeShowDay: function(date) {
		    	var string = jQuery.datepicker.formatDate('dd/mm/yy', date);
					return [dates.indexOf(string) >= 0];
		  	},
				onSelect: function(){
					$('#request_date').prop('disabled', false);
				}
			});
		}
		error: function(response) {
    console.log(response.status + " " + response.statusText);
		}
	});

	$('#request_date').click(function() {
		$('#hidden_input1').attr('value', $('#datepicker_from').val());
		$('#hidden_input2').attr('value', $('#datepicker_to').val());
	});
});
