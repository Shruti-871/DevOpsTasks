# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container at /app
COPY requirements.txt /app/

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Expose the port the app runs on (default Flask port is 5000)
EXPOSE 80

# Set environment variables for Flask
ENV FLASK_ENV=development
ENV DATABASE_URI=sqlite:///mydb.db

# Run the Flask application
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "80"]
