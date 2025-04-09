#!/bin/sh

echo "Running migrations..."
pipenv run python manage.py migrate

echo "Collecting static files..."
pipenv run python manage.py collectstatic --noinput

echo "Starting server..."
pipenv run python manage.py runserver 0.0.0.0:8000