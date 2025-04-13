#!/bin/sh

echo "Running migrations..."
pipenv run python manage.py migrate

echo "Collecting static files..."
pipenv run python manage.py collectstatic --noinput

echo "Starting server..."
pipenv run gunicorn homepage.wsgi:application --bind 0.0.0.0:8000