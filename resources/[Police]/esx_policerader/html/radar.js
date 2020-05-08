$(document).ready(function () {

    $('#Radar').hide();

    window.addEventListener('message', function (event) {
        var item = event.data;

        $('#Radar #CarSpeed span').html(parseInt(item.patrolSpeed));

        if(item.type == 'limit'){
            if(item.status == 'up'){
                speedlimit = parseInt($('#Radar #SpeedLimit span').html())+5;
            }else{
                speedlimit = parseInt($('#Radar #SpeedLimit span').html())-5;
            }
            $('#Radar #SpeedLimit span').html(parseInt(speedlimit));
        }
        if(item.type == 'power'){
            if(item.power == true){
                $('#Radar #Power').removeClass('poweroff').addClass('poweron').attr("data-val","on");
            }else{
                $('#Radar #Power').removeClass('poweron').addClass('poweroff').attr("data-val","off");
            }
        }
        if(item.radar == true){
            $('#Radar').show();
            if( item.speedkm == 0){
                $('#Radar #plate').html('');
                $('#Radar #model').html('');
                $('#Radar #speed span').html(0);
            }else{
                $('#Radar #plate').html(item.plate);
                $('#Radar #model').html(item.model );
                $('#Radar #speed span').html(parseInt(item.speedkm));

                if($('#Radar #Power').attr("data-val") == "on"){
                    var speedlimit  = parseInt($('#Radar #SpeedLimit span').html())
                    speed       = $('#Radar #speed span').html()
                    
                    if( speed > speedlimit ){

                        difference = (parseInt(item.speedkm)-parseInt(speedlimit))
                        if( difference < 10){
                            $class = "success"
                        }else if(difference < 20){
                            $class = "warning"
                        }else{
                            $class = "danger"
                        }

                        html =        '<div id="' + item.plate + '" class="item">';
                        html = html + '<div class="plate">'  + item.plate + '</div>';
                        html = html + '<div class="model">'  + item.model + '</div>';
                        html = html + '<div class="speed ' + $class + '">'  + parseInt(item.speedkm) + ' KM</div>';
                        html = html + '<div class="speedlimit">'  + parseInt(speedlimit) + ' KM</div>';
                        html = html + '<div style="clear:bold"></div>';
                        html = html + '</div>';

                        if($('#Radar #List .list .item').length == 0){
                            $('#Radar #List .list').append(html);
                        }else{
                            if( $('#Radar #List #' + item.plate ).length == 0){
                                $('#Radar #List .list .item').eq(0).before(html);
                            }
                        }

                        if($('#Radar #List .list .item').length > 8){
                            for (var i = 8; i < 18; i++) {
                                $('#Radar #List .list .item').eq(i).remove();
                            }
                        }
                        
                        if(item.radartablet == true){
                            $.post("http://yourpradar/yourpradar-callback", JSON.stringify({
                                radar   : item.radar,
                                plate   : item.plate,
                                model   : item.model,
                                Km      : parseInt(item.speedkm),
                                limit   : parseInt($('#Radar #SpeedLimit span').html())
                            }))
                        }
                        

                    }
                }
            }
            
            
        }else{
            $('#Radar').hide();
        }
        

    })


    document.addEventListener('keyup', function (data) {
        if (data.which == 27) {
            $.post("http://yourpradar/radar-callback", JSON.stringify({
                hide: true
            }))
        }
    });

});
