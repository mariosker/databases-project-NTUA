from faker import Faker
import random
import functools
from datetime import date


def calculate_age(born):
    today = date.today()
    return today.year - born.year - ((today.month, today.day) <
                                     (born.month, born.day))


fake = Faker('el_GR')

mywordlist = ['ελεύθερος', 'παντρεμένος', 'χωρισμένος']
mywordlist2 = ['αντρας', 'γυναίκα']
cities = ["Αθήνα", "Θεσσαλονίκη", "Βέροια"]

a = functools.partial(random.randint, 0, 9)
gen = lambda: "697{}{}{}{}{}{}{}".format(a(), a(), a(), a(), a(), a(), a())

f = open("customer.sql", "w+")
# f.write("INSERT INTO `customer` VALUES ")
f.write(
    "INSERT INTO `customer`(`first_name`, `middle_name`, `last_name`, `street`, `number`, `zip`, `city`, `birth_date`, `relationship_status`, `nr_kids`, `gender`, `phone_number`, `points`) VALUES "
)
'''
INSERT INTO `customer`(`card_id`, `first_name`, `middle_name`, `last_name`,
                    `street`, `number`, `zip`, `city`, `birth_date`, `age`, `relationship_status`, `nr_kids`, `gender`, `phone_number`, `points`) VALUES ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6],[value-7],[value-8],[value-9],[value-10],[value-11],[value-12],[value-13],[value-14],[value-15])
'''

for i in range(1, 201):
    if i != 1:
        f.write(",")
    gender = fake.sentence(ext_word_list=mywordlist2).split()[0]
    if gender == "Αντρας":
        full_name = fake.name_male()
    else:
        full_name = fake.name_female()

    if '-' not in full_name:
        full_name = full_name.split()
        first_name = full_name[0]
        middle_name = "NULL"
        last_name = full_name[1]
    else:
        full_name = full_name.split()
        (first_name, middle_name) = full_name[0].split("-")
        last_name = full_name[1]

    addr = fake.address().split("\n")
    street = " ".join(addr[0].split()[:-1])
    building_number = addr[0].split()[-1][:-1]
    addr_zip = random.randint(10000, 99999)
    addr__city = random.choice(cities)
    cdate = fake.date_between('-100y', '-18y')
    status = random.choice(mywordlist)
    f.write(
        "('{}', {}, '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}')\n"
        .format(first_name,
                f"'{middle_name}'" if middle_name != "NULL" else middle_name,
                last_name, street, building_number, addr_zip, addr__city,
                cdate, status,
                0 if status == "ελεύθερος" else random.randint(0, 6), gender,
                gen(), random.randint(0, 10000)))
