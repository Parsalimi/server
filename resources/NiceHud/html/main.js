$(function(){
	window.addEventListener('message', function(event) {
		if (event.data.action == "updateStatus"){
			updateStatus(event.data.status);
		}else if (event.data.action == "setTalking"){
			setTalking(event.data.value)
		}else if (event.data.action == "setProximity"){
			setProximity(event.data.value)
		} else if (event.data.action == "updateHudPosition") {
			updateHudPosition(event.data.value)
		} else if (event.data.action == "updatePlayerHealth") {
			updatePlayerHealth(event.data.values)
		} else if (event.data.action == "setBarStatus") {
			setBarStatus(event.data.values)
		}
		else if (event.data.action == "toggle"){
            if (event.data.show){
                $('#container').show();
            } else{
                $('#container').hide();
            }
        }
	});

});

function updatePlayerHealth(values) {
	var health = values.health;
	var armor = values.armor;

	if (health < 50 && health > 25 ) {
		$('#healthbar').css('background-color', '#c66d23');
	} else if (health < 25) {
		$('#healthbar').css('background-color', '#931c1c');
	} else {
		$('#healthbar').css('background-color', '#528952');
	}

	$('#healthbar').css('width', health + '%');
	$('#armorbar').css('width', armor + '%');
}

function updateHudPosition(Minimap) {
	var width = Minimap.width;
	var x = Minimap.left_x;
	var y = Minimap.bottom_y;

	var xCalc = (x * $(window).width());
	var widthCalc = width * $(window).width()+ 2;
	var yCalc = (y * $(window).height()) - 25;

	$('#container').css('left', xCalc + 'px').css('top', yCalc + 'px').css('width', widthCalc + 'px')
}

function updateStatus(status){
	var hunger = status[0];
	var thirst = status[1];

	/* Apply the status */
	$('#foodbar').css('width', hunger.percent+'%');
	$('#thirstbar').css('width', thirst.percent+'%');
}

function setProximity(value){
	var width;
	var speaker;
	var label;
	if (value == "whisper"){
		width = 10;
		label = "whisper";
	}else if (value == "normal"){
		width = 50;
		label = "normal";
	}else if (value == "shout"){
		width = 100;
		label = "shout";
	}
	$('#voipbar').css('width', width+'%');
}

function setTalking(value){
	if (value){
		$('#voipbar').css('background-color', '#9B5E87')
	}else{
		$('#voipbar').css('background-color', '#c0c5ce')
	}
}