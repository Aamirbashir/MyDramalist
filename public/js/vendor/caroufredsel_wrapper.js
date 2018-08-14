$(function () {
        if ($(window).width() > 479) {
        $items = 6;
    } else {
        $items = 1;
    }
    $(window).on('load', function () {
        $('#images').carouFredSel({
            width: '100%',
            items: {
                visible: 5,
                start: -1
            },
            scroll: {
                items: 1,
                duration: 2000,
                timeoutDuration: 4000
            },
            prev: '#prev',
            next: '#next',
            pagination: {
                container: '#pager',
                deviation: 1
            }
        });
        $('#carousel-middle > div').carouFredSel({
            width: '100%',
            height: 300,
            align: false,
            auto: true,
            prev: '#prev',
            next: '#next',
            scroll: {
                easing: 'quadratic'
            },
            items: {
                visible: 1,
                width: 'variable',
                height: 300
            }
        });
        $('#images2').carouFredSel({
            width: '100%',
            items: {
                visible: $items,
                start: -1
            },
            scroll: {
                items: 1,
                duration: 1000,
                timeoutDuration: 2000
            },
            prev: '#prev2',
            next: '#next2',
            pagination: {
                container: '#pager',
                deviation: 1
            }
        });
        $('#carousel-middle > div').carouFredSel({
            width: '100%',
            height: 300,
            align: false,
            auto: true,
            prev: '#prev2',
            next: '#next3',
            scroll: {
                easing: 'quadratic'
            },
            items: {
                visible: 1,
                width: 'variable',
                height: 300
            }
        });


        $('#thumbs').carouFredSel({
            synchronise: ['#images3', false, true],
            auto: true,
            direction: 'up',
            items: {
                visible: 4,
                start: -2
            },
            scroll: {
                onBefore: function (data) {
                    data.items.old.eq(1).removeClass('selected');
                    data.items.visible.eq(1).addClass('selected');
                }
            },
            prev: '#prev4',
            next: '#next5'
        });

        $('#images3').carouFredSel({
            auto: false
        });

        $('#thumbs img').click(function () {
            $('#thumbs').trigger('slideTo', [this, -1]);
        });
        $('#thumbs img:eq(1)').addClass('selected');

    });
});