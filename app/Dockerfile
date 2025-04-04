FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Set environment variables
ENV PORT 8000

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port the app runs on
EXPOSE ${PORT}

# Command to run the application
CMD ["python", "app.py"]
