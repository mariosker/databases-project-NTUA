import random
import time
from faker import Faker
import datetime
from datetime import timedelta
from datetime import datetime
from random import randrange

max_product_id = 87
max_store_id = 10
# INSERT INTO `transaction`(`transaction_id`, `date_time`, `total_cost`, `payment_type`) VALUES
# ([value-1],[value-2],[value-3],[value-4])
fake = Faker('el_GR')


def random_date():
    hours = random.randint(8, 19)
    minutes = random.randint(0, 59)
    secs = random.randint(0, 59)
    hours = "{0:02d}".format(hours)
    minutes = "{0:02d}".format(minutes)
    secs = "{0:02d}".format(secs)

    months = "{0:02d}".format(random.randint(1, 12))
    days = "{0:02d}".format(random.randint(1, 31))

    return (
        f"{random.randint(2018,2020)}-{months}-{days} {hours}:{minutes}:{secs}"
    )


payments = ["Κάρτα", "Μετρητά"]

with open("transaction.sql", 'w', encoding="utf-8") as f:

    f.write(
        "INSERT INTO `transaction`(`transaction_id`, `date_time`, `payment_type`) VALUES\n"
    )

    maxi = 2000

    for t in range(1, maxi):
        date_time = random_date()
        transaction_id = t
        payment_type = random.choice(payments)

        f.write(f"({transaction_id},'{date_time}','{payment_type}')" +
                (",\n" if t != (maxi - 1) else "\n"))
