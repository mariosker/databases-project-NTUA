$(document).ready(function () {
  $("#filtertransactioninstore").selectpicker();
  $.ajax({
    type: "get",
    url: "services/get_stores.php",
    dataType: "json",
    success: function (response) {
      //   console.log(response);
      response.forEach((e) => {
        $("#filtertransactioninstore").append(
          "<option>" + e.storename + "</option>"
        );
      });
      $("#filtertransactioninstore").selectpicker("refresh");
    },
  });
});
