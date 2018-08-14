"use strict";
$(document).ready(function () {
//+++++++++++++++++++++++++++++++++++++++++++
//     Latest News Jquery Code Start
//+++++++++++++++++++++++++++++++++++++++++++
    $('#tick2').html($('#tick').html());
//alert($('#tick2').offset.left);

    var temp = 0, intervalId = 0;
    $('#tick li').each(function () {
        var offset = $(this).offset();
        var offsetLeft = offset.left;
        $(this).css({'left': offsetLeft + temp});
        temp = $(this).width() + temp + 10;
    });
    $('#tick').css({'width': temp + 40, 'margin-left': '20px'});
    temp = 0;
    $('#tick2 li').each(function () {
        var offset = $(this).offset();
        var offsetLeft = offset.left;
        $(this).css({'left': offsetLeft + temp});
        temp = $(this).width() + temp + 10;
    });
    $('#tick2').css({'width': temp + 40, 'margin-left': temp + 40});
    function abc(a, b) {

        var marginLefta = (parseInt($("#" + a).css('marginLeft')));
        var marginLeftb = (parseInt($("#" + b).css('marginLeft')));
        if ((-marginLefta <= $("#" + a).width()) && (-marginLefta <= $("#" + a).width())) {
            $("#" + a).css({'margin-left': (marginLefta - 1) + 'px'});
        } else {
            $("#" + a).css({'margin-left': temp});
        }
        if ((-marginLeftb <= $("#" + b).width())) {
            $("#" + b).css({'margin-left': (marginLeftb - 1) + 'px'});
        } else {
            $("#" + b).css({'margin-left': temp});
        }
    }

    function start() {
        intervalId = window.setInterval(function () {
            abc('tick', 'tick2');
        }, 50);
    }

    $(function () {
        $('#outer').mouseenter(function () {
            window.clearInterval(intervalId);
        });
        $('#outer').mouseleave(function () {
            start();
        });
        start();
    });
//+++++++++++++++++++++++++++++++++++++++++++
//     owl-demo Jquery Code Start
//+++++++++++++++++++++++++++++++++++++++++++   
    $("#owl-demo").owlCarousel({
        autoPlay: true,
        navigation: true,
        slideSpeed: 300,
        paginationSpeed: 400,
        singleItem: true,
        items: 1,
        navigationText: ['<i class="fa fa-angle-right slide-angle"></i>', '<i class="fa fa-angle-left slide-angle"></i>'],
        pagination: false
    });
//+++++++++++++++++++++++++++++++++++++++++++
//     xp-economics-post-owl Jquery Code Start
//+++++++++++++++++++++++++++++++++++++++++++   
    $("#xp-economics-post-owl").owlCarousel({
//        autoPlay: true,
        navigation: true,
        navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        pagination: false,
        items: 2,
        itemsDesktop: [1199, 2],
        itemsDesktopSmall: [979, 2]
    });
//+++++++++++++++++++++++++++++++++++++++++++
//       grid-iso Jquery Code Start
//+++++++++++++++++++++++++++++++++++++++++++  
    $(window).on('load', function () {
//        PreLoader
        jQuery(".spinner-wrapper").delay(1000).fadeOut("slow");
        
//        Isotope Gallery
        $('.grid-iso').isotope({
            layoutMode: 'packery',
            itemSelector: '.element-item'
        });
        // init Isotope
        var $grid = $('.grid').isotope({
            itemSelector: '.element-item',
            layoutMode: 'packery',
            packery: {
                gutter: 5
            }
        });
    });
//+++++++++++++++++++++++++++++++++++++++++++
//     Featured-owl Jquery Code Start
//+++++++++++++++++++++++++++++++++++++++++++   
    $("#featured-owl").owlCarousel({
//        autoPlay: true,
        navigation: false,
        navigationText: false,
        pagination: true,
        items: 3,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [991, 2]
    });
//+++++++++++++++++++++++++++++++++++++++++++
//     testimonial-owl Jquery Code Start
//+++++++++++++++++++++++++++++++++++++++++++   
    $("#testimonial-owl").owlCarousel({
        autoPlay: true,
        navigation: false,
        slideSpeed: 300,
        paginationSpeed: 400,
        singleItem: true,
        items: 1,
        navigationText: false,
        pagination: true
    });
//+++++++++++++++++++++++++++++++++++++++++++
//     second-owl Jquery Code Start
//+++++++++++++++++++++++++++++++++++++++++++   
    $("#second-owl-demo").owlCarousel({
//        autoPlay: true,
        navigation: false,
        slideSpeed: 300,
        paginationSpeed: 400,
        singleItem: true,
        items: 1,
        navigationText: false,
        pagination: true
    });
//+++++++++++++++++++++++++++++++++++++++++++
//     featured-videos-owl Jquery Code Start
//+++++++++++++++++++++++++++++++++++++++++++   
    $("#featured-videos-owl").owlCarousel({
//        autoPlay: true,
        navigation: true,
        slideSpeed: 300,
        paginationSpeed: 400,
        singleItem: true,
        items: 1,
        navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        pagination: true
    });
    //+++++++++++++++++++++++++++++++++++++++++++
//       therd-owl Jquery Code Start
//+++++++++++++++++++++++++++++++++++++++++++   
    $("#therd-owl-demo").owlCarousel({
        autoPlay: true,
        navigation: true,
        slideSpeed: 300,
        paginationSpeed: 400,
        singleItem: true,
        items: 1,
        navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        pagination: true
    });
    //+++++++++++++++++++++++++++++++++++++++++++
//       therd-owl Jquery Code Start
//+++++++++++++++++++++++++++++++++++++++++++   
    $("#postartical-owl-demo").owlCarousel({
//        autoPlay: true,
        navigation: true,
        slideSpeed: 300,
        paginationSpeed: 400,
        singleItem: true,
        items: 1,
        navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        pagination: false
    });
    //+++++++++++++++++++++++++++++++++++++++++++
//       singlepost-owl Jquery Code Start
//+++++++++++++++++++++++++++++++++++++++++++   
    $("#singlepost-owl").owlCarousel({
        autoPlay: true,
        navigation: true,
        slideSpeed: 300,
        paginationSpeed: 400,
        singleItem: true,
        items: 1,
        navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        pagination: false
    });
//+++++++++++++++++++++++++++++++++++++++++++
//     xp-related-artical-owl Jquery Code Start
//+++++++++++++++++++++++++++++++++++++++++++   
    $("#xp-related-artical-owl").owlCarousel({
//        autoPlay: true,
        navigation: true,
        navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        pagination: false,
        items: 3,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [979, 2]
    });
    //+++++++++++++++++++++++++++++++++++++++++++
//      Swiper slide Jquery  
//+++++++++++++++++++++++++++++++++++++++++++     
    var galleryTop = new Swiper('.gallery-top', {
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        spaceBetween: 10,
    });
    var galleryThumbs = new Swiper('.gallery-thumbs', {
        spaceBetween: 10,
        centeredSlides: true,
        slidesPerView: 'auto',
        touchRatio: 0.2,
        slideToClickedSlide: true
    });
    galleryTop.params.control = galleryThumbs;
    galleryThumbs.params.control = galleryTop;
//+++++++++++++++++++++++++++++++++++++++++++
//     xp-alsolike-owl Jquery Code Start
//+++++++++++++++++++++++++++++++++++++++++++   
    $("#xp-alsolike-owl").owlCarousel({
        autoPlay: true,
        navigation: true,
        navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        pagination: false,
        items: 4,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [979, 2]
    });
//+++++++++++++++++++++++++++++++++++++++++++
//    isotop gallry Jquery Code start
//+++++++++++++++++++++++++++++++++++++++++++

// external js: isotope.pkgd.js
    var $grid = $('.grid');
// filter functions
    var filterFns = {
        // show if number is greater than 50
        numberGreaterThan50: function () {
            var number = $(this).find('.number').text();
            return parseInt(number, 10) > 50;
        },
        // show if name ends with -ium
        ium: function () {
            var name = $(this).find('.name').text();
            return name.match(/ium$/);
        }
    };
// bind filter button click
    $('.filters-button-group').on('click', 'button', function () {
        var filterValue = $(this).attr('data-filter');
        // use filterFn if matches value
        filterValue = filterFns[ filterValue ] || filterValue;
        $grid.isotope({filter: filterValue});
    });
// change is-checked class on buttons
    $('.button-group').each(function (i, buttonGroup) {
        var $buttonGroup = $(buttonGroup);
        $buttonGroup.on('click', 'button', function () {
            $buttonGroup.find('.is-checked').removeClass('is-checked');
            $(this).addClass('is-checked');
        });
    });

//+++++++++++++++++++++++++++++++++++++++++++
//    skillbar Jquery Code start
//+++++++++++++++++++++++++++++++++++++++++++
    jQuery('.skillbar').each(function () {
        jQuery(this).appear(function () {
            jQuery(this).find('.count-bar').animate({
                width: jQuery(this).attr('data-percent')
            }, 3000);
            var percent = jQuery(this).attr('data-percent');
            jQuery(this).find('.count').html('<span>' + percent + '</span>');
        });
    });
//+++++++++++++++++++++++++++++++++++++++++++
//   xp-mid-footer-right-inner sliderStart
//+++++++++++++++++++++++++++++++++++++++++++   
    $("#xp-mid-footer-right-inner").owlCarousel({
        autoPlay: true,
        navigation: false,
        navigationText: false,
        pagination: false,
        items: 3,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [991, 2],
        itemsMobile: [479, 1]
    });
//+++++++++++++++++++++++++++++++++++++++++++
//     xp-forth-banner-owl Jquery Code Start
//+++++++++++++++++++++++++++++++++++++++++++   
    $("#xp-forth-banner-owl").owlCarousel({
        autoPlay: true,
        navigation: true,
        navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        pagination: true,
        items: 3,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [979, 2]
    });
//+++++++++++++++++++++++++++++++++++++++++++
//    version5-vediopost-owl slider Start
//+++++++++++++++++++++++++++++++++++++++++++   
    $("#version5-vediopost-owl").owlCarousel({
//        autoPlay: true,
        navigation: true,
        navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        pagination: true,
        items: 3,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [979, 2]
    });
    //+++++++++++++++++++++++++++++++++++++++++++
//     homefive-gllery-owl Code Start
//+++++++++++++++++++++++++++++++++++++++++++   
    $("#homefive-gllery-owl").owlCarousel({
//        autoPlay: true,
        navigation: true,
        slideSpeed: 300,
        paginationSpeed: 400,
        singleItem: true,
        items: 1,
        navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        pagination: false
    });
//+++++++++++++++++++++++++++++++++++++++++++
//     featured-frst-owl Jquery Code Start
//+++++++++++++++++++++++++++++++++++++++++++   
    $("#featured-frst-owl").owlCarousel({
//        autoPlay: true,
        navigation: false,
        navigationText: false,
        pagination: true,
        items: 3,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [991, 2]
    });
});