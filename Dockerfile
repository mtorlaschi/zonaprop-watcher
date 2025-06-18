# Use official Python base image
FROM python:3.10-slim

# Install system dependencies for Playwright and xvfb
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    xvfb \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libxkbcommon0 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libgbm1 \
    libasound2 \
    libpangocairo-1.0-0 \
    libpango-1.0-0 \
    libgtk-3-0 \
    libx11-xcb1 \
    libxcb1 \
    libxss1 \
    libxtst6 \
    libcurl4-openssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy local files to container
COPY . /app

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip
RUN pip install playwright

# Install browsers for playwright
RUN playwright install chromium

# Expose port if needed (not mandatory for scripts)
EXPOSE 8000

# Run the scraper with xvfb-run to simulate display
CMD ["xvfb-run", "--auto-servernum", "--server-args='-screen 0 1024x768x24'", "python", "zonaprop_check.py"]

