var entered = false;

$(document).ready(function() {

    $(".container").show();
    $(".bars").show();
    $(".welcomescreen").hide().fadeIn(500)
    $(".multicharacter").hide();
    $('#myProgress').hide()
    $(".delete-character").hide();
    $(".create-character").hide();

    window.addEventListener('message', function(event) {
        var data = event.data;
        if (data.type === "charSelect") {
            if (data.status == true) {
                $(".container").fadeIn(250);
            } else {
                $(".container").fadeOut(250);
            }
        }

        if (data.type === "setupCharacters") {
            var characters = data.characters
            if (characters !== null) {
                $.each(characters, function(index, char) {
                    $('[data-charid=' + char.cid +']').html('')
                    $('[data-charid=' + char.cid +']').html('<div class="slot-name"><p><span id="slot-player-name">' + char.slotname + '</span></p></div>' +
                    '<div class="play-button" data-cid="' + char.cid + '"><p>Selecteer Karakter</p></div>' +
                    '<div class="delete-button" data-cid="' + char.cid + '"><p>Verwijder Karakter</p></div>' +
                    '<div class="player-info"><div class="player-character"><p><span id="bold-text">Naam</span>: <span id="player-fn">'+char.firstname+' </span><span id="player-tv">'+char.tussenvoegsel+' </span><span id="player-ln">'+char.lastname+' </span></p><p><span id="bold-text">Geboortedag</span>: <span id="player-dob">' + char.dob + '</span></p><p><span id="bold-text">Geslacht</span>: <span id="player-sex">'+char.sex+'</span></p><p><span id="bold-text">Telefoon-nummer</span>: <span id="player-phone">'+char.phone+'</span></p><p><span id="bold-text">BSN</span>: <span id="player-bsn">'+char.bsn+'</span></p></div>' +
                    '<div class="player-account"><p><span id="bold-text">Contant</span>: $ <span id="player-cash">'+formatMoney(char.cash)+'</span></p><p><span id="bold-text">Bank</span>: $ <span id="player-bank">'+formatMoney(char.bank)+'</span></p><p><span id="bold-text">Bankrekeningnummer</span>: <span id="player-bank-1">'+char.banknumber+'</span></p></div>' +
                    '<div class="player-job"><p><span id="bold-text">Baan</span>: <span id="player-job">'+char.job+'</span></p><p><span id="bold-text">Functie</span>: <span id="player-grade">'+char.job_grade+'</span></p></div></div>')
                })
            }
        }

        $(".play-button").click(function(evt){
            evt.preventDefault();
            var characterid = $(this).data('cid')

            $.post('http://tb-core/selectCharacter', JSON.stringify({
                cid: characterid
            }));
        });

        $(".delete-button").click(function(evt){
            evt.preventDefault();
            var characterid = $(this).data('cid')
            $(".multicharacter").fadeOut(250);
            $(".delete-character").fadeIn(250);
            $(".accept-delete").data('cid', characterid)
        });
    });

    document.onkeyup = function (data) {
        if (data.which == 13) {
            if (entered === false) {
                entered = true;
                $('.welcomescreen').fadeOut(250)
                $('#myProgress').fadeIn(250)
                move()
                loadingText()
                retrieveData()
                return
            }
        }
    };
});

$("#accept-delete").click(function(e) {
    e.preventDefault();
    var characterid = $(this).data('cid')
    $.post('http://tb-core/deleteCharacter', JSON.stringify({
        cid: characterid
    }));
    entered = false;
    $(".delete-character").hide();
    setTimeout(function() {
        $(".welcomescreen").fadeIn(250);
        $('[data-charid=' + characterid +']').html('<div class="create-button" id="create-cid-'+characterid+'"><p>Nieuw Karakter</p></div><div class="slot-name"><p><span id="slot-player-name">Leeg</span></p></div>')
    }, 500);
});

$(".create-button").click(function(e){
    e.preventDefault();
    var cid = $(this).data('cid');
    console.log(cid)
    $(".multicharacter").children().addClass("reverseAnimation");
    $(".multicharacter").fadeOut(1000);
    setTimeout(function(){
        $(".reverseAnimation").removeClass("reverseAnimation");
    }, 1000);
    $(".create-character").fadeIn(250);
    $('.accept-create').data('cid', cid)
})

$(".deny-create").click(function(e){
    e.preventDefault();
    $(".multicharacter").fadeIn(300);
    $(".create-character").addClass("create-character-reverse")
    setTimeout(function(){
        $(".create-character-reverse").removeClass("create-character-reverse");
    }, 750);
    $(".create-character").fadeOut(400);
})

$("#deny-delete").click(function(e) {
    e.preventDefault();
    $(".multicharacter").fadeIn(250);
    $(".delete-character").fadeOut(250);
});

$(".accept-create").click(function(e) {
    e.preventDefault();
    var charid = $(this).data('cid');
    var data = {
        firstname: $('#firstname').val(),
        tussenvoegsel: $('#tussenvoegsel').val(),
        lastname: $('#lastname').val(),
        nationality: $('#nationality').val(),
        sex: $('#sex').val(),
        dob: $('#dob').val(),
        slotname: $('#slotname').val(),
        cid: charid
    };
    $.post('http://tb-core/createCharacter', JSON.stringify({
        charData: data
    }))
    entered = false;
    $(".create-character").fadeOut(250);
    $(".welcomescreen").fadeIn(250);
});

function move() {
    var elem = document.getElementById("myBar");
    var width = 0;
    var id = setInterval(frame, 50);
    function frame() {
        if (width >= 100) {
            clearInterval(id);
            $('#myProgress').addClass("myProgressHide")
            setTimeout(function(){
                $(".myProgressHide").hide();
                $(".myProgressHide").removeClass("myProgressHide");
            }, 1000);
            $(".multicharacter").fadeIn(250);
        } else {
            width++;
        }
    }
}

function loadingText() {
    setTimeout(function() {
        $("#progbar-wait").append(".");
        setTimeout(function() {
            $("#progbar-wait").append(".");
            setTimeout(function() {
                $("#progbar-wait").append(".");
                setTimeout(function() {
                    $("#progbar-wait").html("Een moment geduld");
                    setTimeout(function() {
                        $("#progbar-wait").append(".");
                        setTimeout(function() {
                            $("#progbar-wait").append(".");
                            setTimeout(function() {
                                $("#progbar-wait").append(".");
                                setTimeout(function() {
                                    $("#progbar-wait").html("Een moment geduld");
                                }, 600);
                            }, 600);
                        }, 600);
                    }, 600);
                }, 600);
            }, 600);
        }, 600);
    }, 600);
}

function retrieveData() {
    setTimeout(function() {
        $("#progbar-text").html("Karakters worden opgehaald");
        setTimeout(function() {
            $("#progbar-text").html("Voertuigen worden opgehaald");
            setTimeout(function() {
                $("#progbar-text").html("Huizen worden opgehaald");
                setTimeout(function() {
                    $("#progbar-text").html("Inventaris wordt opgehaald");
                    setTimeout(function() {
                        $("#progbar-text").html("Gegevens succesvol opgehaald");
                    }, 1300);
                }, 800);
            }, 900);
        }, 1500);
    }, 1);
}

function formatMoney(n, c, d, t) {
    var c = isNaN(c = Math.abs(c)) ? 2 : c,
        d = d == undefined ? "." : d,
        t = t == undefined ? "," : t,
        s = n < 0 ? "-" : "",
        i = String(parseInt(n = Math.abs(Number(n) || 0).toFixed(c))),
        j = (j = i.length) > 3 ? j % 3 : 0;

    return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t);
};
