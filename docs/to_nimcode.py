import csv
with open('error_code.csv', newline='') as f:
    reader = csv.reader(f)
    for row in reader:
        #print(row)
        print(f"  of {row[0]}:")
        print(f'    raise newException({row[0][3:]},"{row[2]}")')
