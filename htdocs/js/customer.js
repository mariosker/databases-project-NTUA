$(document).ready(function () {
  function getAge(dateString) {
    var today = new Date();
    var birthDate = new Date(dateString);
    var age = today.getFullYear() - birthDate.getFullYear();
    var m = today.getMonth() - birthDate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
      age--;
    }
    return age;
  }

  queryString = window.location.search;
  urlParams = new URLSearchParams(queryString);
  var id = urlParams.get("id");
  var dataString = { id: id }; // πρέπει να ναι json
  $.ajax({
    type: "POST",
    url: "services/get_customer.php",
    data: dataString,
    dataType: "JSON", // απέφευγε το jsonp
    success: function (data) {
      console.log(data);
      if (data) {
        $("#name").text(
          data.last_name +
            " " +
            data.first_name +
            (data.middle_name == null ? "" : " " + data.middle_name)
        );

        $("#address").text(
          data.street + " " + data.number + ", " + data.zip + " " + data.city
        );

        $("#phone").text(data.phone_number);
        $("#age").text(getAge(data.birth_date));
        $("#points").text(data.points);

        var state = data.relationship_status;
        if (data.gender == "Γυναίκα") {
          state = state.slice(0, -1);
          state = state.slice(0, -1);
          state = state + "η";
        }

        $("#state").text(state);
        if (data.nr_kids > 0) {
          $("#kids").text(
            "with " + data.nr_kids + (data.nr_kids == 1 ? " kid" : " kids")
          );
        }
      }
    },
  });
  $.ajax({
    type: "POST",
    url: "services/most_popular_products_bought_by_customer.php",
    data: { card_id: id },
    dataType: "JSON",
    success: function (response) {
      response.forEach((e) => {
        $("#popular_prods tbody").append("<tr></tr>");
        $("#popular_prods tr").append("<td>" + e.product_name + "</td>");
        $("#popular_prods tr").append("<td>" + e.category + "</td>");
        $("#popular_prods tr").append("<td>" + e.number_of_times + "</td>");
      });
    },
  });
});
