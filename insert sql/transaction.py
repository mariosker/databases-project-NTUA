import random

max_product_id = 87
max_store_id = 10
# INSERT INTO `transaction`(`transaction_id`, `date_time`, `total_cost`, `payment_type`, `total_items_bought`)
# VALUES ([value-1],[value-2],[value-3],[value-4],[value-5])

pairs = set()
with open("has.sql", 'w') as f:

    f.write(
        "INSERT INTO `transaction`(`transaction_id`, `date_time`, `total_cost`, `payment_type`, `total_items_bought`) VALUES\n"
    )

    maxi = 2000

    for t in range(1, maxi):
        while True:
            product_id = random.randint(1, max_product_id)
            store_id = random.randint(1, max_store_id)
            if (product_id, store_id) in pairs:
                continue
            pairs.add((product_id, store_id))
            break
        stored_quantity = random.randint(1, 200)
        aisle = random.randint(1, 60)
        shelve = random.randint(1, 10)
        current_price = random.randint(1, 100)
        transaction_id = t
        f.write(
            f"({transaction_id},{store_id},{stored_quantity},{aisle},{shelve})"
            + (",\n" if t != (maxi - 1) else "\n"))
