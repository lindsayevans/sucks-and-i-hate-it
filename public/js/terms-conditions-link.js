$(function(){
	$('a[rel=terms-conditions]').click(function(){
		// Or open in jQuery UI dialog widget
		window.open($(this).attr('href'), 'termsConditionsWin');
		return false;
	});
});
