$(function() {

    Morris.Area({
        element: 'morris-area-chart',
        data: 
        	/* example data
        	[{
            period: '2010 Q1',
            iphone: 2222,
            ipad: null,
            itouch: 2647
        }, {
            period: '2010 Q2',
            iphone: 2778,
            ipad: 2294,
            itouch: 2441
        }, {
            period: '2010 Q3',
            iphone: 4912,
            ipad: 1969,
            itouch: 2501
        }, {
            period: '2010 Q4',
            iphone: 3767,
            ipad: 3597,
            itouch: 5689
        }, {
            period: '2011 Q1',
            iphone: 6810,
            ipad: 1914,
            itouch: 2293
        }, {
            period: '2011 Q2',
            iphone: 5670,
            ipad: 4293,
            itouch: 1881
        }, {
            period: '2011 Q3',
            iphone: 4820,
            ipad: 3795,
            itouch: 1588
        }, {
            period: '2011 Q4',
            iphone: 15073,
            ipad: 5967,
            itouch: 5175
        }, {
            period: '2012 Q1',
            iphone: 10687,
            ipad: 4460,
            itouch: 2028
        }, {
            period: '2012 Q2',
            iphone: 8432,
            ipad: 5713,
            itouch: 1791
        }],
        */
        [{
        	period : '2016-01-02',
        	max_v : 24,
        	average_v : 10,
        	distance : 100
        },{
        	period : '2016-01-05',
        	max_v : 32,
        	average_v : 9,
        	distance : 150
        },{
        	period : '2016-04-05',
        	max_v : 10,
        	average_v : 5,
        	distance : 60
        },{
        	period : '2016-05-07',
        	max_v : 50,
        	average_v : 40,
        	distance : 90
        },{
        	period : '2016-08-07',
        	max_v : 32,
        	average_v : 40,
        	distance : 200
        },{
        	period : '2016-10-07',
        	max_v : 50,
        	average_v : 20,
        	distance : 125
        }],
    
        
        // xkey : 날짜, ykeys : 평점(임시 최고속도)
        xkey: 'period',
        ykeys : ['max_v', 'average_v', 'distance'],
        labels : ['max','average','distance'],
        //ykeys: ['iphone', 'ipad', 'itouch'],
        //labels: ['iPhone', 'iPad', 'iPod Touch'],
        pointSize: 2,
        hideHover: 'auto',
        resize: true
    });

    Morris.Donut({
        element: 'morris-donut-chart',
        data: [{
            label: "Download Sales",
            value: 12
        }, {
            label: "In-Store Sales",
            value: 30
        }, {
            label: "Mail-Order Sales",
            value: 20
        }],
        resize: true
    });

    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            y: '2006',
            a: 100,
            b: 90
        }, {
            y: '2007',
            a: 75,
            b: 65
        }, {
            y: '2008',
            a: 50,
            b: 40
        }, {
            y: '2009',
            a: 75,
            b: 65
        }, {
            y: '2010',
            a: 50,
            b: 40
        }, {
            y: '2011',
            a: 75,
            b: 65
        }, {
            y: '2012',
            a: 100,
            b: 90
        }],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B'],
        hideHover: 'auto',
        resize: true
    });

});
