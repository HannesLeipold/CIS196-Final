document.write(my_var)
$(function () {
	$('#defaultCountdown2').countdown({until: '+'+parseInt(my_var)+'m +15s', format: 'YOWDHMS', significant: 3});
});
console.log(my_var)
