import random
import time
from faker import Faker
import datetime
from datetime import timedelta
from datetime import datetime
from random import randrange

max_has_id = 500 + 1


def random_date():
    hours = random.randint(8, 19)
    minutes = random.randint(0, 59)
    secs = random.randint(0, 59)
    hours = "{0:02d}".format(hours)
    minutes = "{0:02d}".format(minutes)
    secs = "{0:02d}".format(secs)

    year = random.randint(2018, 2020)
    months = "{0:02d}".format(random.randint(1, 12))
    days = "{0:02d}".format(random.randint(1, 28))
    while True:
        a = datetime(int(year), int(months), int(days))
        if a.weekday() != 'Sunday':
            a = f"{year}-{months}-{days} {hours}:{minutes}:{secs}"
            return (a)


with open("price_log.sql", 'w') as f:

    f.write(
        "INSERT INTO `price_log`(`price_log_id`, `date`, `value`, `has_id`) VALUES\n"
    )

    a = [i for i in range(1, max_has_id)]
    b = max_has_id + int(max_has_id * random.random())

    d = {}

    for i in range(1, b):
        if a == []:
            a = [i for i in range(1, has_id)]
        has_id = random.choice(a)
        a.remove(has_id)
        quantity_b = random.randint(1, 10)
        if (has_id in d):
            value = d[has_id] + random.randint(0, 2) + random.random()
            d[has_id] = value
        else:
            value = random.randrange(0, 200) + random.random()
            d[has_id] = value

        value = "{:.2f}".format(value)
        f.write(f"({i},'{random_date()}',{value},{has_id})" +
                (",\n" if i != b - 1 else "\n"))
