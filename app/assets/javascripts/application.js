// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require bootstrap-sprockets
//= require bootstrap-wysihtml5
//= require ckeditor/init
//= require bootstrap-multiselect
//= require cocoon


//= require_tree .


$(document).on('ready ajaxStart ajaxStop',function () {

    console.log("WTF!");
    CKEDITOR.config.disableNativeSpellChecker = false;

    CKEDITOR.config.scayt_autoStartup = true;

    $('#multi_select').multiselect({
        enableFiltering: true,
        includeSelectAllOption: true,
        selectAllJustVisible: false,
        numberDisplayed: 1

    });


    $(".move_it").click(function() {
        console.log("clicked!");
        window.scrollTo(0, 0);

        var $container = $('.scroll'),
            $scrollTo = $('#show_article');

        $container.scrollTop(
            $scrollTo.offset().top - $container.offset().top + $container.scrollTop()
        );

    });

});
