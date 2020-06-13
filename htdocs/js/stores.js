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
        // $("#storest tr#" + e.store_id).append(
        //   "<td> <a href='store.html?id=" +
        //     e.store_id +
        //     "'>" +
        //     e.street +
        //     " " +
        //     e.number +
        //     ", " +
        //     e.zip +
        //     " " +
        //     e.city +
        //     "</a></td>"
        // );
        $("#storest tr#" + e.store_id).append(
          "<td>" + e.operating_hours + "</td>"
        );
        $("#storest tr#" + e.store_id).append("<td>" + e.store_area + "</td>");
      });
    },
  });
});
