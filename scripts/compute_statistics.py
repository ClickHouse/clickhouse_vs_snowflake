import argparse
import json
from pathlib import Path

import numpy as np

parser = argparse.ArgumentParser(description='Compute statistics',
                                 formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('-f', '--result_folder', help='Folder of results', default='top_sub_projects/results/')
args = parser.parse_args()

files = Path(args.result_folder).glob('*.json')
stats = []

print('database, test, hold/cold, min, max, mean, median, 95th, 99th')
for file in files:
    with open(file, 'r') as result_file:
        results = json.load(result_file)
        for i in range(2):
            values = []
            for result in results['result']:
                values.append(min(result) if i == 0 else max(result))
            print(f'{file.name.split(".")[0].split("_")[0]}, {"_".join(file.name.split(".")[0].split("_")[1:])}, '
                  f'{"hot" if i == 0 else "cold"} , {round(np.min(values), 2)}, {round(np.max(values), 2)}, {round(np.mean(values), 2)}, '
                  f'{round(np.percentile(values, 50), 2)}, {round(np.percentile(values, 95), 2)}, {round(np.percentile(values, 99), 2)}')

