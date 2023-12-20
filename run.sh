#!/bin/bash

set -e

if [ "${ENV}" == 'DEV' ]; then
    echo "Development Mode"
    exec python zero.py
elif [ "${ENV}" == 'UNIT' ]; then
    echo "Test Mode"
    exec python test.py
else
    echo "Production Mode"
    exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/zero.py --callable app --stats 0.0.0.0:9191 --stats-http
fi
