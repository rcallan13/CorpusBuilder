# File: filewalker.py

import turicreate as tc

data = tc.SFrame.read_json('search_results.json', orient='records')
pagemaps = data['pagemap']

def walkFile(pagemaps):
	for s in pagemaps:
		for m in s:
			#print(s[m])
			for j in s[m]:
				print(j)


walkFile(pagemaps)


