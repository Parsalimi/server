$('document').ready(function() {

    $(".container").hide();

    var dragging = false;
    var draggingid = "none";

    var successAudio = document.createElement('audio');
    successAudio.controls = false;
    successAudio.volume = 0.25;
    successAudio.src = './success.wav';
    
    var failAudio = document.createElement('audio');
    failAudio.controls = false;
    failAudio.volume = 0.1;
    failAudio.src = './fail.wav';

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                $(".container").fadeIn();
                $("#used-item").fadeOut(100);
            } else {
                $(".container").fadeOut();
            }
        }

        if (item.type == "addInventoryItem") {
            var itemdata = item.addItemData;
            var element = $("<div class='added-item-slot' id='added-item-image'><div class='item-bg' style ='background-image: url(img/items/" + itemdata.name + ".png')'><div class='label'><p><span id='iLabel'>" + itemdata.label + "</span></p></div></div></div>");
            $("#added-item").html("");
            $("#added-item").append(element).hide().fadeIn(100);
            setTimeout(function () {
                $(element).fadeOut(100, function () { $(this).remove(); });
            }, 2500);
        }

        if (item.type == "useHBItem") {
            var itemdata = item.itemData;
            var element = $("<div class='used-item-slot' id='used-item-image'><div class='item-bg' style ='background-image: url(img/items/" + itemdata.name + ".png')'><div class='label'><p><span id='iLabel'>" + itemdata.label + "</span></p></div></div></div>");
            $("#used-item").html("");
            $("#used-item").append(element).hide().fadeIn(100);
            setTimeout(function () {
                $(element).fadeOut(100, function () { $(this).remove(); });
            }, 2500);
        }

        $(".clear-inv-log").click(function (e) {
            e.preventDefault();
            var log =  $('.inv-log').html();
            if (log !== "") {
                $('.inv-log').html("Inventory Log has been cleared!");
                setTimeout(function () {
                    $('.inv-log').html("");
                }, 1000)
                successAudio.play();
            } else {
                failAudio.play();
            }
        })

        if (item.type == "setItems") {
            $("#other-inventory").html("");
            inventorySetup(event.data.itemList)
            $('#p-maxweight').html((event.data.maxplayerkg / 1000).toFixed(2) + " kg");
            $('#p-currentweight').html((event.data.playerkg / 1000).toFixed(2));
            $('#player-bsn').html("BSN: " + event.data.pBSN);

            $(".item").draggable({
                helper: 'clone',
                appendTo: 'body',
                zIndex: 99999,
                revert: 'invalid',
                start: function() {
                    var item = this;
                    draggingid = item;
                    dragging = true;

                    
                    itemData = $(this).data("item");

                    if (!itemData.usable) {
                        $("#use").addClass('disabled');
                    }
                },

                stop: function() {
                    $("#use").removeClass('disabled');
                }
            });
        }

        $("#use").droppable({
            accept: '.item',
            hoverClass: 'button-hover',
            drop: function(event, ui) {
                itemData = $(draggingid).data("item");

                if (itemData.usable) {
                    $.post('http://tb-inventory/useItem', JSON.stringify({
                        data: itemData
                    }));
                }
            }
        })

        $("#drop").droppable({
            accept: '.item',
            hoverClass: 'button-hover',
            drop: function(event, ui) {
                itemData = $(draggingid).data("item");
                itemamount = parseInt($(".amountvalue").val());
                $.post('http://tb-inventory/dropItem', JSON.stringify({
                    data: itemData,
                    amount: itemamount
                }));

                if (itemData.type == 'item') {
                    if (itemData.amount - itemamount == 0 ) {
                        setTimeout(function () {
                            $("#slot-" + itemData.slot).html("<div class='label'><p><span id='iLabel'></span></p></div></div>")
                        }, 800);
                    }
                } else if (itemData.type == 'weapon') {
                    setTimeout(function () {
                        $("#slot-" + itemData.slot).html("<div class='label'><p><span id='iLabel'></span></p></div></div>")
                    }, 800);
                }
            }
        })

        if (item.type === "setupHouseSlots") {
            setupHouseSlots(event.data.houseslots)

            $(".slot").droppable({
                accept: '.item',
                hoverClass: 'slot-hover',
                drop: function(event, ui) {
                    item = draggingid;
                    slot = this;
                    invType = $(item).data("inventory");
                    if (invType == "player") {
                        itemData = $(item).data("item");
                    } else {
                        itemData = $(item).data("other-item");
                    }
                    if (itemData == undefined){
                        console.log("Itemdata undefined: KONKER", $(slot).find( ":first-child" ).data("other-item"));
                        return false;
                    }
                    if (slot.id != "other-slot-" + itemData.slot) {
                        if ($(slot).find(":first-child").hasClass("other-item")){
                            slotData = $(slot).find( ":first-child" ).data("other-item");
                            $(item).parent().addClass("temp123");
                            $(".temp123").html($(slot).html());
                            $(".temp123").find(":first-child").attr("id", "other-item-"+$(".temp123").attr('id'));
                            $(".temp123").find(":first-child").data("other-item", slotData);
                            $(".temp123").removeClass("temp123");
                            slotData.slot = itemData.slot;
                            if (slotData.type === "item") {
//                                 $.post('http://tb-inventory/updateSlot', JSON.stringify({
//                                     name: slotData.item,
//                                     slot: slotData.slot
//                                 }));
                            } else if (slotData.type === "weapon") {
                                // $.post('http://tb-inventory/updateWeaponSlot', JSON.stringify({
                                //     weaponid: slotData.weaponid,
                                //     slot: slotData.slot
                                // }));
                            }
                        } else{
                            if (invType == "house") {
                                $("#other-slot-" + itemData.slot).html("<div class='label'><p><span id='iLabel'></span></p></div></div>");
                            } else {
                                $("#slot-" + itemData.slot).html("<div class='label'><p><span id='iLabel'></span></p></div></div>");
                            }
                            console.log('yerrrrrrrrrrr')
                        }
                        itemData.slot = slot.id;
                        $(slot).html(item);
                        $(slot).find(":first-child").attr("id", "other-item-"+$(slot).attr('id'));
                        $(slot).find(":first-child").data("other-item", itemData);
                        itemData.slot = slot.id.replace("other-slot-", '');
                        if (itemData.type === "item") {
//                             $.post('http://tb-inventory/updateSlot', JSON.stringify({
//                                 name: itemData.item,
//                                 slot: itemData.slot.replace(/slot-/, '')
//                             }));
                        } else if (itemData.type === "weapon") {
                            // $.post('http://tb-inventory/updateWeaponSlot', JSON.stringify({
                            //     weaponid: itemData.weaponid,
                            //     slot: itemData.slot
                            // }));
                        }
                        dragging = false;
                        setTimeout(function(){
                            $(".item").draggable({
                                helper: 'clone',
                                appendTo: 'body',
                                zIndex: 99999,
                                revert: 'invalid',
                                start: function() {
                                    var item = this;
                                    draggingid = item;
                                    dragging = true;
                                }
                            });
                        }, 100);
                    }
                }
            });
        }

        if (item.type === "setHouseItems") {
            HouseinventorySetup(event.data.itemListHouse)

            $(".item").draggable({
                helper: 'clone',
                appendTo: 'body',
                zIndex: 99999,
                revert: 'invalid',
                start: function() {
                    var item = this;
                    draggingid = item;
                    dragging = true;
                    itemData = $(this).data("other-item");
                    itemInventory = $(this).data("inventory");
                    console.log(itemData.usable)
                    if (itemInventory === "house") {
                        if (!itemData.usable) {
                            $("#use").addClass('disabled');
                        }
                    }
                },

                stop: function() {
                    $("#use").removeClass('disabled');
                }
            });
        }

        if (item.type === "setupSlots") {
            setupSlots(event.data.maxslots)

            $(".slot").droppable({
                accept: '.item',
                hoverClass: 'slot-hover',
                drop: function(event, ui) {
                    item = draggingid;
                    slot = this;
                    itemData = $(item).data("item");
                    invType = $(draggingid).data("inventory");
                    if (itemData == undefined){
                        console.log("Itemdata undefined: ", $(slot).find( ":first-child" ).data("item"));
                        return false;
                    }
                    if (slot.id != "slot-" + itemData.slot) {
                        if ($(slot).find( ":first-child" ).hasClass("item")){
                            slotData = $(slot).find( ":first-child" ).data("item");
                            $(item).parent().addClass("temp123");
                            $(".temp123").html($(slot).html());
                            $(".temp123").find(":first-child").attr("id", "item-"+$(".temp123").attr('id'));
                            $(".temp123").find(":first-child").data("item", slotData);
                            $(".temp123").removeClass("temp123");
                            slotData.slot = itemData.slot;
                            InventoryLog(invType + ': you succesfully replaced \''+itemData.label+'\' with \''+slotData.label+'\'');
                            if (slotData.type === "item") {
                                $.post('http://tb-inventory/updateSlot', JSON.stringify({
                                    name: slotData.item,
                                    slot: slotData.slot
                                }));
                                successAudio.play();
                            } else if (slotData.type === "weapon") {
                                $.post('http://tb-inventory/updateWeaponSlot', JSON.stringify({
                                    weaponid: slotData.weaponid,
                                    slot: slotData.slot
                                }));
                                successAudio.play();
                            }
                        }else{
                            $("#slot-" + itemData.slot).html("<div class='label'><p><span id='iLabel'></span></p></div></div>");
                            InventoryLog(invType + ': you succesfully moved \''+itemData.label+'\' from \'slot: '+itemData.slot+'\' to \'slot: '+slot.id.replace("slot-", '')+'\'');
                        }
                        itemData.slot = slot.id;
                        $(slot).html(item);
                        $(slot).find(":first-child").attr("id", "item-"+$(slot).attr('id'));
                        $(slot).find(":first-child").data("item", itemData);
                        itemData.slot = slot.id.replace("slot-", '');
                        if (itemData.type === "item") {
                            $.post('http://tb-inventory/updateSlot', JSON.stringify({
                                name: itemData.item,
                                slot: itemData.slot.replace(/slot-/, '')
                            }));
                            successAudio.play();
                        } else if (itemData.type === "weapon") {
                            $.post('http://tb-inventory/updateWeaponSlot', JSON.stringify({
                                weaponid: itemData.weaponid,
                                slot: itemData.slot
                            }));
                            successAudio.play();
                        }
                        dragging = false;
                        setTimeout(function(){
                            $(".item").draggable({
                                helper: 'clone',
                                appendTo: 'body',
                                zIndex: 99999,
                                revert: 'invalid',
                                start: function() {
                                    var item = this;
                                    draggingid = item;
                                    dragging = true;
                                }
                            });
                        }, 100);
                    }
                }
            });
        }
    })

    document.onkeyup = function (data) {
        if (data.which == 27 ) {
            $.post('http://tb-inventory/exit', JSON.stringify({}));
            return
        }
    };

    document.onkeydown = function (data) {
        if (data.which == 9) {
            $.post('http://tb-inventory/exit', JSON.stringify({}));
            return
        }
    };
})

function inventorySetup(items) {
    $.each(items, function (index, item) {
        count = setCount(item);
        $("#slot-" + item.slot).html("<div class='item' id='item-slot-" + item.slot +"' onclick='itemDescriptionOn(this)'><div class='item-bg' style ='background-image: url(img/items/" + item.item + ".png')'><div class='label'><p><span id='iLabel'>" + item.label +"</span></p></div><div class='info'><p><span id='iInfo'>" + count + "</span></p></div></div></div>");
        $('#item-slot-' + item.slot).data('item', item);
        $('#item-slot-' + item.slot).data('inventory', "player");
    });
}

function HouseinventorySetup(items) {
    $.each(items, function (index, item) {
        count = setCount(item);
        $("#other-slot-" + item.slot).html("<div class='item' id='other-item-slot-" + item.slot +"' onclick='itemDescriptionOn(this)'><div class='item-bg' style ='background-image: url(img/items/" + item.item + ".png')'><div class='label'><p><span id='iLabel'>" + item.label +"</span></p></div><div class='info'><p><span id='iInfo'>" + count + "</span></p></div></div></div>");
        $('#other-item-slot-' + item.slot).data('item', item);
        $('#other-item-slot-' + item.slot).data('inventory', "house");
    });
}

function setCount(item) {
    if (item.type == "item") {
        count = item.amount + " (" + (item.amount * item.weight / 1000).toFixed(2) +")"
    }

    if (item.type === "weapon") {
        if (count == 0) {
            count = "0";
        } else {
            count = '<img src="img/bullet.png" class="ammoIcon"> ' + item.amount;
        }
    }

    return count;
}

function setupSlots(amount) {
    $("#player-inventory").html("");
    for(var i = 0; i < amount; i++) {
        var slot = $("<div class='slot' id='slot-"+i+"'><div class='label'><p><span id='iLabel'></span></p></div></div>");
        $("#player-inventory").append(slot);
    }
}

function setupHouseSlots(amount) {
    $("#other-inventory").html("");
    for(var i = 0; i < amount; i++) {
        var slot = $("<div class='slot' id='other-slot-"+i+"'><div class='label'><p><span id='iLabel'></span></p></div></div>");
        $("#other-inventory").append(slot);
    }
}

function itemDescriptionOn(obj) {
    itemData = $(obj).data("item");
    if (itemData.label !== undefined) {
        var element = $("<div class='item-desc-info'><p><span id='item-name'>"+ itemData.label +"</span></p><hr class='item-hr'><p><span id='item-desc'>" + itemData.description + "</span></p><p><span id='item-amount'><span class='strong'>Hoeveelheid</span>: " + itemData.amount + "</span></p><p><span id='item-weight'><span class='strong'>Gewicht p.st.</span>: " + (itemData.weight / 1000).toFixed(2) + " kg</span></p></div>") .fadeIn(200);
        $("#item-information").html("");
        $("#item-information").append(element);
        setTimeout(function () {
            $(element).fadeOut(100, function () { $(this).remove(); });
        }, 3500);
    }
}

function InventoryLog(log) {
    var currentLog = $('.inv-log').html();
    $('.inv-log').html(log + "<br>" + currentLog);
}