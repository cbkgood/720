// window.onload = function()
// {
//     var sessionname = document.getElementById('sessionname').value;
//     alert(sessionname);
//     var deviceId="3";
//     var url="showecharts";
//     var device_name = "asdf";
//     var get_record = "asdfasdf";
//     $.post(url,{"device_name":"内容","action":"get_record"},function (data) {
//         var json=eval("("+data+")");
//         // alert(json);
//         var list=json.aaData;
//         var j = list.length;
//         // alert(j);
//         var xbar = new Array()
//         for(var i=0;i<j;i++){
//             xbar[i] = list[i].device_id;
//         }
//         // xbar[0]=list[0].device_id;
//         // xbar[1]=list[1].device_id;
//         // xbar[2]=list[2].device_id;
//         // xbar[3]=list[3].device_id;
//         var ybar = new Array()
//         for(var i=0;i<j;i++){
//             ybar[i] = list[i].device_name;
//         }
//
//         //ybar[0]=list.length;
//         // ybar[1]=list.length;
//         //  ybar[2]=5;
//         //  ybar[3]=1;
//         // 使用
//         // 基于准备好的dom，初始化echarts图表
//         var myChart = echarts.init(document.getElementById('main'));
//
//         var option = {
//             tooltip: {
//                 show: true
//             },
//             legend: {
//                 data:['课程分数']
//             },
//             toolbox: {
//                 show : true,
//                 orient: 'horizontal' ,
//                 x: 'right',
//                 y: 'top',
//                 feature : {
//                     mark : {show: true},
//
//                     magicType : {show: true, type: ['bar', 'line']},
//                     restore : {show: true},
//                     saveAsImage : {show: true}
//                 }
//             },
//             xAxis : [
//                 {
//                     type : 'category',
//                     data : xbar
//                 }
//             ],
//             yAxis : [
//                 {
//                     type : 'value'
//                 }
//             ],
//             series : [
//                 {
//                     "name":"销量",
//                     "type":"bar",
//                     "data":ybar
//                 }
//             ]
//         };
//
//         // 为echarts对象加载数据
//         myChart.setOption(option);
//     })
// }
// window.onresize = function(){
//     myChart.resize();
//     // myChart2.resize();
//     // myChart3.resize();
//     // myChartN.resize();
// }
//


window.onload = function()
{
    // var sessionname = document.getElementByName("sessionname")[0].value;
    // alert(sessionname);
    // alert(document.getElementById('sessionname').value+"asdf");
    var sessionname = document.getElementById('sessionname').value;
    var deviceId="3";
    var url="showecharts";
    var device_name = "asdf";
    var get_record = "asdfasdf";
    $.post(url,{"userid":sessionname,"action":"get_record"},function (data) {
        var json=eval("("+data+")");
        // alert(json);
        var list=json.aaData;
        var j = list.length;
        // alert(j);
        var xbar = new Array()
        for(var i=0;i<j;i++){
            xbar[i] = list[i].device_id;
        }
        // xbar[0]=list[0].device_id;
        // xbar[1]=list[1].device_id;
        // xbar[2]=list[2].device_id;
        // xbar[3]=list[3].device_id;
        var ybar = new Array()
        for(var i=0;i<j;i++){
            ybar[i] = parseInt(list[i].device_name);
        }

        //ybar[0]=list.length;
        // ybar[1]=list.length;
        //  ybar[2]=5;
        //  ybar[3]=1;
        // 使用
        // 基于准备好的dom，初始化echarts图表
        var myChart = echarts.init(document.getElementById('main'));

        var option = {
            dataZoom: [
                {   // 这个dataZoom组件，默认控制x轴。
                    type: 'slider', // 这个 dataZoom 组件是 slider 型 dataZoom 组件
                    start: 0,      // 左边在 10% 的位置。
                    end: 100     ,   // 右边在 60% 的位置。

                },
                {   // 这个dataZoom组件，也控制x轴。
                    type: 'inside', // 这个 dataZoom 组件是 inside 型 dataZoom 组件
                    start: 0,      // 左边在 10% 的位置。
                    end: 100     // 右边在 60% 的位置。
                },
                {
                    type: 'slider',
                    yAxisIndex: 0,
                    start: 0,
                    end: 100
                },
                {
                    type: 'inside',
                    yAxisIndex: 0,
                    start: 0,
                    end: 100
                }
            ],
            //     tooltip: {
            //         show: true
            //     },
            //     legend: {
            //         data:['销量']
            //     },
            //     toolbox: {
            //         show : true,
            //         orient: 'horizontal' ,
            //         x: 'right',
            //         y: 'top',
            //         feature : {
            //             mark : {show: true},
            //
            //             magicType : {show: true, type: ['bar', 'line']},
            //             restore : {show: true},
            //             saveAsImage : {show: true}
            //         }
            //     },
            //     xAxis : [
            //         {
            //             type : 'category',
            //             data : xbar
            //         }
            //     ],
            //     yAxis : [
            //         {
            //             type : 'value'
            //         }
            //     ],
            //     series : [
            //         {
            //             "name":"销量",
            //             "type":"bar",
            //             "data":ybar
            //         },
            //         {
            //             markLine : {
            //
            //             data : [
            //         {type : 'average', name: '平均值'}
            //     ]
            // }},
            //     ],

            title : {
                text: '课程统计',
                subtext: '综合显示'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['各科成绩','最低成绩']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    magicType : {show: true, type: ['line','bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : false,
                    data : xbar,
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    data : ybar,
                }
            ],
            series : [
                {
                    name:'各科成绩',
                    type:'line',
                    data:ybar,
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: '平均值'}
                        ]
                    }
                },
                // {
                //     name:'最低气温',
                //     type:'line',
                //     data:[1, -2, 2, 5, 3, 2, 0],
                //     markPoint : {
                //         data : [
                //             {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                //         ]
                //     },
                //     markLine : {
                //         data : [
                //             {type : 'average', name : '平均值'}
                //         ]
                //     }
                // }
            ]
        };



        // 为echarts对象加载数据
        myChart.setOption(option);
        window.onresize = myChart.resize;
    })
}

// window.onresize = function(){
//     myChart.resize();
//     // myChart2.resize();
//     // myChart3.resize();
//     // myChartN.resize();
// }
// series : [
//     {
//         name:'最高气温',
//         type:'line',
//         data:[11, 11, 15, 13, 12, 13, 10],
//         markPoint : {
//             data : [
//                 {type : 'max', name: '最大值'},
//                 {type : 'min', name: '最小值'}
//             ]
//         },
//         markLine : {
//             data : [
//                 {type : 'average', name: '平均值'}
//             ]
//         }
//     },
//     {
//         name:'最低气温',
//         type:'line',
//         data:[1, -2, 2, 5, 3, 2, 0],
//         markPoint : {
//             data : [
//                 {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
//             ]
//         },
//         markLine : {
//             data : [
//                 {type : 'average', name : '平均值'}
//             ]
//         }
//     }
// ]
