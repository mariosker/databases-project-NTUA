$(document).ready(function () {
  $.ajax({
    type: "get",
    url: "services/get_customers.php",
    dataType: "json",
    success: function (response) {
      //   console.log(response);
      response.forEach((e) => {
        $("#customerst tbody").append("<tr id='" + e.card_id + "'></tr>");
        $("#customerst tr#" + e.card_id).append(
          "<td>" +
            (e.gender == "Αντρας"
              ? '<i class="fa fa-male"></i>'
              : '<i class="fa fa-female"></i>') +
            "</td>"
        );
        $("#customerst tr#" + e.card_id).append(
          "<td> <a href='customer.html?id=" +
            e.card_id +
            "'>" +
            e.last_name +
            " " +
            e.first_name +
            (e.middle_name != null ? " " + e.middle_name : "") +
            "</a></td>"
        );

        $("#customerst tr#" + e.card_id).append(
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
        $("#customerst tr#" + e.card_id).append(
          "<td>" + e.phone_number + "</td>"
        );
        $("#customerst tr#" + e.card_id).append("<td>" + e.points + "</td>");

        $("#customerst tr#" + e.card_id).append(
          "<td align='center'>" +
            `<button
                id="edit_customer` +
            e.card_id +
            `"
                class="btn btn-sm btn-secondary ml-2 text-center"
                data-toggle="modal"
                data-target="#edit_customer_modal"
              >
              <i class="fas fa-edit"></i>
              </button> <button
              id="delete_customer` +
            e.card_id +
            `"
              class="btn btn-sm btn-secondary ml-2 text-center"
            >
            <i class="fas fa-trash"></i>
            </button>` +
            "</td>"
        );

        $("#edit_customer" + e.card_id).click(() => {
          $("#edit_first_name").val(e.first_name);
          $("#edit_middle_name").val(e.middle_name);
          $("#edit_last_name").val(e.last_name);
          $("#edit_gender").val(e.gender);
          $("#edit_street_address").val(e.street);
          $("#edit_building_number_address").val(e.number);
          $("#edit_zip_address").val(e.zip);
          $("#edit_city_address").val(e.city);
          $("#edit_birth_date").val(e.birth_date);
          $("#edit_phone_number").val(e.phone_number);
          $("#edit_status").val(e.relationship_status);
          $("#edit_nr_kids").val(e.nr_kids);
          $("#edit_customer_info").click(() => {
            $.ajax({
              type: "post",
              url: "services/edit_customer.php",
              data: {
                card_id: e.card_id,
                points: e.points,
                first_name: $("#edit_first_name").val(),
                middle_name: $("#edit_middle_name").val(),
                last_name: $("#edit_last_name").val(),
                street: $("#edit_street_address").val(),
                number: $("#edit_building_number_address").val(),
                zip: $("#edit_zip_address").val(),
                city: $("#edit_city_address").val(),
                birth_date: $("#edit_birth_date").val(),
                phone_number: $("#edit_phone_number").val(),
                gender: $("#edit_gender").val(),
                status: $("#edit_status").val(),
                nr_kids: $("#edit_nr_kids").val(),
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
        $("#delete_customer" + e.card_id).click(() => {
          $.ajax({
            type: "post",
            url: "services/delete_customer.php",
            data: {
              card_id: e.card_id,
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

  $("#insert_customer_info").click(() => {
    var street_address = $("#street_address").val();
    var building_number_address = $("#building_number_address").val();
    var zip_address = $("#zip_address").val();
    var city_address = $("#city_address").val();

    var first_name = $("#first_name").val();
    var middle_name = $("#middle_name").val();
    var last_name = $("#last_name").val();

    var birth_date = $("#birth_date").val();
    var phone_number = $("#phone_number").val();
    var gender = $("#gender").val();
    var status = $("#status").val();
    var nr_kids = $("#nr_kids").val();

    $(document).ready(function () {
      $.ajax({
        type: "post",
        url: "services/insert_customer.php",
        data: {
          first_name: first_name,
          middle_name: middle_name,
          last_name: last_name,
          street: street_address,
          number: building_number_address,
          zip: zip_address,
          city: city_address,
          birth_date: birth_date,
          phone_number: phone_number,
          gender: gender,
          status: status,
          nr_kids: nr_kids,
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
