(function (window, $) {

    $(document).ready(function(){

        $(document).on("click", ".ts-playButton", function(){
            $(".video-overlay").remove();
           $("body").prepend(`
<div class="video-overlay">
<iframe src="https://www.aparat.com/v/96Wu8" frameborder="0" allowfullscreen=""></iframe>
</div>
            `).addClass("body-fixed");
        });
        
        $(document.body).on("click", ":not(.video-overlay *)", function(){
           $(".video-overlay").remove(); 
            $("body").removeClass("body-fixed");
        });
        
        $(document).on("click", ".mobile-menuToggler", function(){
            $(".video-overlay").remove();
            $("body").prepend(`<div class="video-overlay">
<div class="mobile-menu">
<a class="mobile-menu-item" href="http://area-games.ro/forum/">Forums</a>
<a class="mobile-menu-item" href="#mixsec">Mix-Servers</a>
</div>
</div>`);
        });
        
        $(document).on("click", ".mobile-mediaToggler", function(){
            $(".video-overlay").remove();
            $("body").prepend(`<div class="video-overlay">
<div class="mobile-menu">
<a class="mobile-menu-item" href="http://steamcommunity.com/groups/area-games">Steam</a>
<a class="mobile-menu-item" href="https://www.facebook.com/areagamesromania/">Facebook</a>
<a class="mobile-menu-item" href="https://www.youtube.com/channel/UC8uEnDg7az1_9QL-94oW8sw">YouTube</a>
</div>
</div>`);
        });

    });

})(window, window.jQuery);