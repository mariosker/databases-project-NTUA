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
  var dataString = { id: id };
  $.ajax({
    type: "POST",
    url: "services/get_customer.php",
    data: dataString,
    dataType: "JSON",
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
            "με " + data.nr_kids + (data.nr_kids == 1 ? " παιδί" : " παιδιά")
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
        $("#popular_prods tbody").append("<tr id='" + e.product_id + "'></tr>");
        $("#popular_prods tr#" + e.product_id).append(
          "<td>" + e.product_name + "</td>"
        );
        $("#popular_prods tr#" + e.product_id).append(
          "<td>" + e.category + "</td>"
        );
        $("#popular_prods tr#" + e.product_id).append("<td>" + e.cnt + "</td>");
      });
    },
  });
  $.ajax({
    type: "POST",
    url: "services/get_store_dates_by_customer.php",
    data: { card_id: id },
    dataType: "JSON",
    success: function (response) {
      console.log(response);
      var uniqueStores = [];
      response.forEach((e) => {
        if (!uniqueStores.includes(e.store_id)) {
          uniqueStores.push(e.store_id);
        }
      });

      var hours = [];
      var i;
      for (i = 8; i <= 20; i++) hours.push(i);
      console.log(hours);
      uniqueStores.forEach((s) => {
        var times = new Array(13).fill(0);
        var name = "";
        response.forEach((e) => {
          if (e.store_id == s) {
            name = e.street + " " + e.number + ", " + e.zip + " " + e.city;
            times[new Date(e.date_time).getHours() - 8] += 1;
          }
        });
        console.log(name);
        console.log(times);
        $("#accordion").append("<div class='card' id='card" + s + "'></div>");

        $("#card" + s).append(
          "<div class='card-header' id='headingOne" + s + "'></div>"
        );
        $("#headingOne" + s).append(
          `<h5 class="mb-0">
            <button
            id = "b` +
            s +
            `"
              class="btn btn-link"
              data-toggle="collapse"
              data-target="#collapseOne` +
            s +
            `"
              aria-expanded="true"
              aria-controls="collapseOne
              ` +
            s +
            `
            "
            </button>
          </h5>`
        );
        $("#b" + s).append(name);
        $("#card" + s).append(
          `<div
          id="collapseOne` +
            s +
            `"
          class="collapse show"
          aria-labelledby="headingOne` +
            s +
            `"
          data-parent="#accordion"
        >
            `
        );
        var output = [];
        for (i = 8; i < 20; i++) {
          output.push(`Ώρα ` + i + `: ` + times[i - 8] + `<br>`);
        }

        $("#collapseOne" + s).append(
          `<div class="card-body"> Φορές που επισκέφτηκε το κατάστημα στις:<br>` +
            output.join("") +
            `</div>`
        );

        // $("#collapseOne" + s).append(
        //   `<div class="card-body"> <canvas id="myChart` +
        //     s +
        //     `" width="400" height="100"></canvas> </div>`
        // );

        // var ctx = document.getElementById("myChart" + s);
        // var myChart = new Chart(ctx, {
        //   type: "bar",
        //   // labels: hours,
        //   labels: ["8", ""],
        //   data: {
        //     datasets: [
        //       {
        //         label: "times",
        //         borderWidth: 1,
        //         data: times,
        //       },
        //     ],
        //   },
        // });
      });
    },
  });
});
