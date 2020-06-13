$(document).ready(function () {
  $.ajax({
    type: "get",
    url: "services/get_all_stores.php",
    dataType: "json",
    success: function (response) {
      // console.log(response);
      response.forEach((e) => {
        $("#storest tbody").append("<tr id='" + e.store_id + "'></tr>");
        $("#storest tr#" + e.store_id).append(
          "<td>" +
            e.street +
            " " +
            e.number +
            ", " +
            e.zip +
            " " +
            e.city +
            "</td>"
        );
        $("#storest tr#" + e.store_id).append(
          "<td>" + e.operating_hours + "</td>"
        );
        $("#storest tr#" + e.store_id).append("<td>" + e.store_area + "</td>");
      });
    },
  });

  $("#insert_store_info").click(() => {
    var street_address = $("#street_address").val();
    var building_number_address = $("#building_number_address").val();
    var zip_address = $("#zip_address").val();
    var city_address = $("#city_address").val();
    var stores_operating_hours = $("#stores_operating_hours").val();
    var stores_area = $("#stores_area").val();
    $(document).ready(function () {
      $.ajax({
        type: "post",
        url: "services/insert_store.php",
        data: {
          store_area: stores_area,
          operating_hours: stores_operating_hours,
          street: street_address,
          number: building_number_address,
          zip: zip_address,
          city: city_address,
        },
        dataType: "json",
        success: function (response) {
          console.log(response);
          if (response.status == "1") {
            alert(response.successmessage);
            window.location.reload();
          } else alert(response.errormessage);
        },
      });
    });
  });
});
