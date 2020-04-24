#!/bin/bash
cd 'silq/test/codeforces/stats'
python3 counting.py -path '../summer18/contest/'
python3 counting.py -path '../winter19/contest/'
python3 counting.py -path './top10submissions/winter19/'
python3 counting.py -path './top10submissions/summer18/'
