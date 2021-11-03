 $(window).on("load",function() {
	 "use strict";
                new $.popup({                
                    title       : '',
                    content         : '<a href="grid.html"><img src="img/popup_img.jpg" alt="Image" class="pop_img"><h3 id="pop_msg">This week special offer <strong>30% OFF</strong> on all Travel Tours!</h3></a><small>Autoclose delay in 5 seconds.</small>', 
					html: true,
					autoclose   : true,
					closeOverlay:true,
					closeEsc: true,
					buttons     : false,
                    timeout     : 5000 
                });
            });