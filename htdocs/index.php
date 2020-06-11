<!-- <!DOCTYPE html> -->
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MyStore</title>
    <link rel='icon' href='./assets/img/favicon.svg' type='image/x-icon'/ >
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    />
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src=".\bootstrap-select-1.13.17\dist\js\bootstrap-select.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./css/stylesheet.css" />
    <link rel="stylesheet" type="text/css" href=".\bootstrap-select-1.13.17\dist\css\bootstrap-select.min.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
      rel="stylesheet"
    />
    <?php
        $servername = "localhost";
        $username = "root";
        $password = "adminroot";

        // Create connection
        $conn = new mysqli($servername, $username, $password);

        // Check connection
        if ($conn->connect_error) {
          die("Connection failed: " . $conn->connect_error);
        }
        // echo "Connected successfully";
      ?>
  </head>
  <body>
    <!-- navigation bar -->
    <nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
      <div class="navbar-header">
        <a class="navbar-brand" href="./index.php"><strong>MyStore</strong></a>
        <button
          class="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
      </div>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="nav navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="./index.php">Sales</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./customers.php">Customers</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./stores.php">Stores</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./statistics.php">Statistics </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./about.php">About </a>
          </li>
        </ul>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row p-2">
        <!-- Side panel for selecting what to view and what to filter out -->
        <div class="col-3">
          <!-- Card for selecting what to view in the table -->
          <div class="card">
            <div class="card-header">
              Select view
            </div>
            <div class="card-body">
            <div class="btn-group-vertical" style="width:100%">
                <button type="button" class="btn btn-light btn-outline-secondary mt-1" style="width:100%" data-toggle="button" aria-pressed="false" autocomplete="off">
                  Date
                </button>
                <button type="button" class="btn btn-light btn-outline-secondary mt-1" style="width:100%" data-toggle="button" aria-pressed="false" autocomplete="off">
                  Customer
                </button>
                <button type="button" class="btn btn-light btn-outline-secondary mt-1" style="width:100%" data-toggle="button" aria-pressed="false" autocomplete="off">
                  Store
                </button>
                <button type="button" class="btn btn-light btn-outline-secondary mt-1" style="width:100%" data-toggle="button" aria-pressed="false" autocomplete="off">
                  Total price
                </button>
                <button type="button" class="btn btn-light btn-outline-secondary mt-1" style="width:100%" data-toggle="button" aria-pressed="false" autocomplete="off">
                  Products quantity
                </button>
                <button type="button" class="btn btn-light btn-outline-secondary mt-1" style="width:100%" data-toggle="button" aria-pressed="false" autocomplete="off">
                  Payment type
                </button>
                <button type="button" class="btn btn-light btn-outline-secondary mt-1" style="width:100%" data-toggle="button" aria-pressed="false" autocomplete="off">
                  Products
                </button>
                </div>
            </div>
          </div>
          <!-- card containing filters for objects in the table -->
          <div class="card mt-1">
            <div class="card-header">
              Filters
            </div>
            <div class="card-body">
              <!-- FILTER STARTS HERE -->
              <div>
              <p>Transaction happened in:</p>
              <select class="selectpicker" data-actions-box="true" multiple data-live-search="true" data-selected-text-format="count > 3" data-width="100%">
                <option>Mustard</option>
                <option>Ketchup</option>
                <option>Relish</option>
              </select>
              <script>
                $('.selectpicker').selectpicker();
              </script>




              </div>
              <p>Transaction happend at:</p>
              <p>Bought products in category:</p>
              <p>Total number of products:</p>
              <p>Total amount of Transaction:</p>
              <p>Transaction made with:</p>
            </div>
          </div>
        </div>
        <!-- Main panel for housing he table containing sales -->
        <div class="col-9">
          <div class="card">
            <!-- <div class="card-header">
              Table of Sales
            </div> -->
            <div class="card-body">
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
              <h1>ΚΡΟΜΜΥΔΑ ΓΑΜΙΕΣΑΙ- ΚΑΝΤΕΡΕ ΨΟΦΑ</h1>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
