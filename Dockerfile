# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory for in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install any dependencies
RUN pip install -r requirements.txt

# Copy the application code into the container
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]