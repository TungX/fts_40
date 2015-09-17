function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

$(document).on("ready page:load", function () {
  $("#notification").delay(3000).slideUp()
});

$(document).on("click", ".checkbox-options", function () {
   var tops = $("#options").find("input:checkbox");
  for (var i = 0; i < tops.length; i++) {
    if (tops[i].type === "checkbox") {
      if($(this).attr("id") != tops[i].id){
        tops[i].checked = false;
      }
    }
  };
});

$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
});
