// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require twitter/bootstrap
//= require_tree .

//$('#project_member_limit').live('click', function(){
//    var num = $(this).val
//});


$(document).ready(function () {
//    $("#member_emails").tokenInput("/url/to/your/script/");
    $("#member_emails").tokenInput("/projects/show_invi_form.json", {
            crossDomain: false,
            prePopulate: $("#member_emails").data("pre"),
//            theme: "facebook",
            propertyToSearch: "email"
        });
});