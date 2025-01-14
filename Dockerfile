# Use the official Python image as a base
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install Gunicorn (WSGI server)
RUN pip install gunicorn

# Copy the Flask app code into the container
COPY . /app/

# Expose the port for the Flask application
EXPOSE 80

# Set the environment variable for Flask app
ENV FLASK_APP=app.py

# Use Gunicorn as the production server instead of Flask's development server
CMD ["gunicorn", "-b", "0.0.0.0:80", "app:app"]
