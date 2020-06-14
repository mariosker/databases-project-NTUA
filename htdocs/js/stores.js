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

        $("#storest tr#" + e.store_id).append(
          "<td align='center'>" +
            `<button
                id="edit_store` +
            e.store_id +
            `"
                class="btn btn-sm btn-secondary ml-2 text-center"
                data-toggle="modal"
                data-target="#edit_store_modal"
              >
              <i class="fas fa-edit"></i>
              </button> <button
                id="delete_store` +
            e.store_id +
            `"
                class="btn btn-sm btn-secondary ml-2 text-center"
              >
              <i class="fas fa-trash"></i>
              </button>` +
            "</td>"
        );

        $("#edit_store" + e.store_id).click(() => {
          $("#edit_street_address").val(e.street);
          $("#edit_building_number_address").val(e.number);
          $("#edit_zip_address").val(e.zip);
          $("#edit_city_address").val(e.city);
          $("#edit_stores_operating_hours").val(e.operating_hours);
          $("#edit_stores_area").val(e.store_area);
          $("#edit_store_info").click(() => {
            $.ajax({
              type: "post",
              url: "services/edit_store.php",
              data: {
                store_id: e.store_id,
                store_area: $("#edit_stores_area").val(),
                operating_hours: $("#edit_stores_operating_hours").val(),
                street: $("#edit_street_address").val(),
                number: $("#edit_building_number_address").val(),
                zip: $("#edit_zip_address").val(),
                city: $("#edit_city_address").val(),
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
        $("#delete_store" + e.store_id).click(() => {
          $.ajax({
            type: "post",
            url: "services/delete_store.php",
            data: {
              id: e.store_id,
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
