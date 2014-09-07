$(function () {
	$('pre code').each(function(i, block) {
		hljs.highlightBlock(block);
	});

	$('.filter a').on('click', function(){
		$(this).parent('.active').toggleClass('asc').toggleClass('desc');
		$(this).parent(':not(.active)').addClass('active desc').siblings('.active').removeClass('active asc desc');
		return false;
	});

	$('#ontop').hide();
	$(window).scroll(function () {
		if ($(this).scrollTop() > 300) {
			$('#ontop').fadeIn(200);
		} else {
			$('#ontop').fadeOut(0);
		}
	});

	$('#ontop').click(function () {
		$(this).hide(0);
		$('body,html').animate({
			scrollTop: 0
		}, 600);
		return false;
	});

	// $('.isotope').isotope();
});

$(window).load(function(){
	// $('.isotope').isotope({
	// 	itemSelector: '.item',
	// 	layoutMode: 'masonry',
	// 	masonry: {gutter: 0}
	// });
});