import random

max_product_id = 87
max_store_id = 10

# INSERT INTO `has`(`product_id`, `store_id`, `stored_quantity`, `aisle`, `shelve`, `current_price`, `has_id`) VALUES
# ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6],[value-7])
pairs = set()
with open("has.sql", 'w') as f:

    f.write(
        "INSERT INTO `has`(`product_id`, `store_id`, `stored_quantity`, `aisle`, `shelf`, `has_id`) VALUES\n"
    )

    for t in range(1, 501):
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
        has_id = t
        f.write(
            f"({product_id},{store_id},{stored_quantity},{aisle},{shelve},{has_id})"
            + (",\n" if t != 500 else "\n"))
