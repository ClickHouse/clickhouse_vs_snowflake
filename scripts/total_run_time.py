import argparse
import json
from pathlib import Path

parser = argparse.ArgumentParser(description='Compute statistics',
                                 formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('-f', '--result_folder', help='Folder of results', default='downloads_per_day/results/')
args = parser.parse_args()


files = Path(args.result_folder).glob('*.json')
print('test,total_time')
for file in files:
    with open(file, 'r') as result_file:
        results = json.load(result_file)
        total = 0
        for result in results['result']:
            total += sum(result)
        print(file.name.split(".")[0], total)
