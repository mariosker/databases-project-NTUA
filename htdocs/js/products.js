$(document).ready(function () {
  $.ajax({
    type: "get",
    url: "services/get_all_products.php",
    dataType: "json",
    success: function (response) {
      response.forEach((e) => {
        $("#productst tbody").append("<tr id='" + e.product_id + "'></tr>");
        $("#productst tr#" + e.product_id).append(
          "<td>" + e.product_name + "</td>"
        );
        $("#productst tr#" + e.product_id).append(
          "<td>" + e.category + "</td>"
        );

        $("#productst tr#" + e.product_id).append(
          "<td class='text-center'>" +
            (e.store_brand == 1 ? '<i class="fas fa-check"></i>' : "") +
            "</td>"
        );

        $("#productst tr#" + e.product_id).append(
          "<td align='center'>" +
            `<button
                  id="edit_product` +
            e.product_id +
            `"
                  class="btn btn-sm btn-secondary ml-2 text-center"
                  data-toggle="modal"
                  data-target="#edit_product_modal"
                >
                <i class="fas fa-edit"></i>
                </button> <button
                id="delete_product` +
            e.product_id +
            `"
                class="btn btn-sm btn-secondary ml-2 text-center"
              >
              <i class="fas fa-trash"></i>
              </button>` +
            "</td>"
        );
        $("#edit_product" + e.product_id).click(() => {
          $("#edit_product_name").val(e.product_name);
          $("#edit_store_brand").val(e.store_brand == 1 ? "Yes" : "No");
          $("#edit_product_category").val(e.category);
          $("#edit_product_info").click(() => {
            $.ajax({
              type: "post",
              url: "services/edit_product.php",
              data: {
                product_id: e.product_id,
                category: $("#edit_product_category").val(),
                store_brand: $("#edit_store_brand").val() == "Yes" ? 1 : 0,
                product_name: $("#edit_product_name").val(),
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
        $("#delete_product" + e.product_id).click(() => {
          $.ajax({
            type: "post",
            url: "services/delete_product.php",
            data: {
              product_id: e.product_id,
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

  $("#insert_product_info").click(() => {
    var product_name = $("#insert_product_name").val();
    var category = $("#insert_product_category").val();
    var store_brand = $("#insert_store_brand").val() == "Yes" ? 1 : 0;
    $(document).ready(function () {
      $.ajax({
        type: "post",
        url: "services/insert_product.php",
        data: {
          product_name: product_name,
          category: category,
          store_brand: store_brand,
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
