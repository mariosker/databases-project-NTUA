function retrieve_data() {
  $.ajax({
    type: "GET",
    url: "services/transactions.php",
    data: {
      filtertransactioninstore: $("#filtertransactioninstore").val(),
      trans_date: $("#trans_date").val(),
      choose_product_category: $("#choose_product_category").val(),
      input_number_of_products: $("#input_number_of_products").val(),
      input_total_cost: $("#input_total_cost").val(),
      select_trans_way: $("#select_trans_way").val(),
    },
    dataType: "JSON",
    success: function (response) {
      display(response);
    },
  });
}

var page_limit = 25;
var page_number = 1;

function display(data) {
  $("#transactionstable tbody").empty();
  $("#showmore").remove();
  for (i = 0; i < page_limit * page_number; i++) {
    e = data[i];
    $("#transactionstable tbody").append(
      "<tr id='" + e.transaction_id + "'></tr>>"
    );
    $("#transactionstable tr#" + e.transaction_id).append(
      "<td>" + e.transaction_id + "</td>"
    );
    $("#transactionstable tr#" + e.transaction_id).append(
      "<td> <a href='customer.html?id=" +
        e.card_id +
        "' target='_blank'>" +
        e.NAME +
        "</a></td>"
    );
    $("#transactionstable tr#" + e.transaction_id).append(
      "<td>" + e.store_name + "</td>"
    );
    $("#transactionstable tr#" + e.transaction_id).append(
      "<td>" + e.date_time + "</td>"
    );
    $("#transactionstable tr#" + e.transaction_id).append(
      "<td>" + e.total + "</td>"
    );
    $("#transactionstable tr#" + e.transaction_id).append(
      "<td>" + e.payment_type + "</td>"
    );
    $("#transactionstable tr#" + e.transaction_id).append(
      "<td>" + e.points + "</td>"
    );
  }
  if (page_limit * page_number < data.length) {
    $("#transactionstable").after(
      `<a id="showmore" class="btn btn-secondary btn-block" role="button">SHOW MORE</a>`
    );
    $("#showmore")
      .off("click")
      .click(() => {
        page_number++;
        display(data);
      });
  }
}

$(document).ready(function () {
  $("#filtertransactioninstore").selectpicker();
  $.ajax({
    type: "get",
    url: "services/get_stores.php",
    dataType: "json",
    success: function (response) {
      console.log(response);
      response.forEach((e) => {
        $("#filtertransactioninstore").append(
          "<option value='" + e.store_id + "'>" + e.storename + "</option>"
        );
      });
      $("#filtertransactioninstore").selectpicker("refresh");
    },
  });

  $("button[type='reset']").click(() => {
    $(".selectpicker").selectpicker("deselectAll");
    $(".selectpicker").selectpicker("refresh");
    retrieve_data();
  });

  $("#filterform input, select").change(() => {
    retrieve_data();
  });
  retrieve_data();
});
