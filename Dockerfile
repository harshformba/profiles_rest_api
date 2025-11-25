# Use the full official Python image (includes more system libraries/tools)
FROM python:3.11

# Set the working directory
WORKDIR /app

# Copy requirements.txt first for efficient build caching
COPY requirements.txt .

# Create virtual environment and install dependencies
RUN python -m venv /opt/venv \
    && /opt/venv/bin/pip install --upgrade pip \
    && /opt/venv/bin/pip install -r requirements.txt

# Copy the rest of your application code into the container
COPY . .

# Make sure commands use the venv by default
ENV PATH="/opt/venv/bin:$PATH"

# Optionally, expose a port (uncomment if your app needs one)
EXPOSE 8000

# Set default command (replace "your_app.py" with your entry point)
CMD ["bash"]



