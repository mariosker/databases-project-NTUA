import random

max_product_id = 87
max_card_id = 200
max_transaction_id = 2000

# INSERT INTO `purchase`(`store_id`, `card_id`, `transaction_id`) VALUES ([value-1],[value-2],[value-3])
with open("contains.sql", 'w') as f:

    f.write(
        "INSERT INTO `contains`(`product_id`, `transaction_id`, `quantity_bought`) VALUES\n"
    )

    a = [i for i in range(1, max_transaction_id)]
    b = max_transaction_id + int(max_transaction_id * random.random())
    for i in range(1, b):
        product_id = random.randint(1, max_product_id)
        # transaction_id = random.randint(1, max_transaction_id - 1)
        transaction_id = random.choice(a)
        a.remove(transaction_id)
        if a == []:
            a = [i for i in range(1, max_transaction_id)]
        quantity_b = random.randint(1, 10)
        f.write(f"({product_id},{transaction_id},{quantity_b})" +
                (",\n" if i != b - 1 else "\n"))
