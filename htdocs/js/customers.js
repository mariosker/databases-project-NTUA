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
});
