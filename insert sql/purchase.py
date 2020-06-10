import random

max_store_id = 10
max_card_id = 200
max_transaction_id = 2000

# INSERT INTO `purchase`(`store_id`, `card_id`, `transaction_id`) VALUES ([value-1],[value-2],[value-3])
with open("purchase.sql", 'w') as f:

    f.write(
        "INSERT INTO `purchase`(`store_id`, `card_id`, `transaction_id`) VALUES\n"
    )

    for i in range(1, max_transaction_id):
        store_id = random.randint(1, max_store_id)
        card_id = random.randint(1, max_card_id)
        f.write(f"({store_id},{card_id},{i})" +
                (",\n" if i != max_transaction_id - 1 else "\n"))
