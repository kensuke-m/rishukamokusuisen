#!/usr/bin/env python3

import pprint
import sys
import csv
from efficient_apriori import apriori

def is_num(t: str) -> bool:
    try:
        float(t)
        return True
    except ValueError:
        return False

args = sys.argv
if 3 <= len(args):
    if is_num(args[1]) and is_num(args[2]):
        file = open('rishudata2018-2022.csv', 'r') # full size dataset
        transactions = list(csv.reader(file, delimiter = ','))
        file.close()
        itemsets, rules = apriori(transactions, min_support = float(args[1]), min_confidence = float(args[2]))
        pprint.pprint(rules)
        print(len(rules))
    else:
        print("Arguments are not numbers")
else:
    print("Too few arguments")
