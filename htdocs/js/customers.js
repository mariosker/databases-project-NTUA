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
