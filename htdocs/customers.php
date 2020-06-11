<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MyStore</title>
    <link rel="icon" href="./assets/img/favicon.svg" type="image/x-icon" />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    />
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./css/stylesheet.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
      rel="stylesheet"
    />
  </head>

  <body>
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
        <div class="col-8">
          <div class="card">
            <div class="card-header">
              Personal Information
            </div>
            <div class="card-body">
              <h1>
                Name:
              </h1>
              <p>
                Address:
              </p>
              <p>
                Phone:
              </p>
              <p>
                Age:
              </p>
              <p>
                Points:
              </p>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card">
            <div class="card-header">Transactions statistics</div>

            <div class="row-6">
              <div class="card">
                <div class="card-body">
                  <p>Average Transactions per week</p>
                </div>
              </div>
            </div>

            <div class="row-6">
              <div class="card">
                <div class="card-body">
                  <p>Average Transactions per month</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- most bought items -->
    <div class="container-fluid">
      <div class="row p-2">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              Most bought products
            </div>
            <div class="class-body">
              <p>
                item1 item2 item3 ...
              </p>
              <p>
                item1 item2 item3 ...
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- vistited -->
    <div class="container-fluid">
      <div class="row p-2">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              Stores costumer has visited
            </div>
            <div class="card-body">
              <div id="accordion">
                <div class="card">
                  <div class="card-header" id="headingOne">
                    <h5 class="mb-0">
                      <button
                        class="btn btn-link"
                        data-toggle="collapse"
                        data-target="#collapseOne"
                        aria-expanded="true"
                        aria-controls="collapseOne"
                      >
                        Store number 1
                      </button>
                    </h5>
                  </div>

                  <div
                    id="collapseOne"
                    class="collapse show"
                    aria-labelledby="headingOne"
                    data-parent="#accordion"
                  >
                    <div class="card-body">
                      STORE TIME GRAPH
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>