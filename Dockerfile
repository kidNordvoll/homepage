FROM python:3.12-slim

WORKDIR /app

#Install system packages
RUN apt update && apt install -y gcc python3-dev build-essential --no-install-recommends

#Install pipenv and dependencies
COPY Pipfile Pipfile.lock ./
RUN pip install pipenv && pipenv install --deploy --ignore-Pipfile

# Copy the rest of the project
COPY . .

# Collect static files
RUN pipenv run python manage.py collectstatic --noinput
