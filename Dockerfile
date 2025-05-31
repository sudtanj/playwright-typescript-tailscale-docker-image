# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set environment variables to avoid user interaction during installation
ENV DEBIAN_FRONTEND=noninteractive


# Update and install basic packages (without nodejs/npm)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        wget \
        git \
        vim \
        nano \
        sudo \
        locales \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js (includes npm and npx) from NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Optionally update npm to the latest version (ensures latest npx)
RUN npm install -g npm@latest

# Install ts-node and typescript globally
RUN npm install -g ts-node typescript

# Install Playwright and its browsers
RUN npm install -g playwright && npx playwright install --with-deps
# Install Playwright dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libnss3 \
        libatk-bridge2.0-0 \
        libgtk-3-0 \
        libx11-xcb1 \
        libxcb1 \
        libxcomposite1 \
        libxdamage1 \
        libxrandr2 \
        libgbm1 \
        libasound2 \
        libpangocairo-1.0-0 \
        libcups2 \
        libxshmfence1 \
        libxfixes3 \
        libxrender1 \
        libxi6 \
        libxtst6 \
        libatspi2.0-0 \
        libdrm2 \
        libdbus-1-3 \
        libpango-1.0-0 \
        libwayland-client0 \
        libwayland-cursor0 \
        libwayland-egl1 \
        libegl1 \
        libopus0 \
        libwoff1 \
        libenchant-2-2 \
        libharfbuzz-icu0 \
        libgdk-pixbuf2.0-0 \
        libevent-2.1-7 \
        libvpx7 \
        libwebp7 \
        libwebpdemux2 \
        libwebpmux3 \
        libjpeg-turbo8 \
        libopenjp2-7 \
        liblcms2-2 \
        libgstreamer1.0-0 \
        libgstreamer-plugins-base1.0-0 \
        fonts-liberation \
        libappindicator3-1 \
        lsb-release \
        xdg-utils \
        libu2f-udev \
        libvulkan1 \
        libgl1 \
        libgles2 \
        libnotify4 \
        libnspr4 \
        libatk1.0-0 \
        libatk-bridge2.0-0 \
        libxss1 \
        libxtst6 \
        libnss3 \
        libx11-xcb1 \
        libxcomposite1 \
        libxdamage1 \
        libxrandr2 \
        libgbm1 \
        libasound2 \
        libpangocairo-1.0-0 \
        libcups2 \
        libxshmfence1 \
        libxfixes3 \
        libxrender1 \
        libxi6 \
        libxtst6 \
        libatspi2.0-0 \
        libdrm2 \
        libdbus-1-3 \
        libpango-1.0-0 \
        libwayland-client0 \
        libwayland-cursor0 \
        libwayland-egl1 \
        libegl1 \
        libopus0 \
        libwoff1 \
        libenchant-2-2 \
        libharfbuzz-icu0 \
        libgdk-pixbuf2.0-0 \
        libevent-2.1-7 \
        libvpx7 \
        libwebp7 \
        libwebpdemux2 \
        libwebpmux3 \
        libjpeg-turbo8 \
        libopenjp2-7 \
        liblcms2-2 \
        libgstreamer1.0-0 \
        libgstreamer-plugins-base1.0-0 \
        fonts-liberation \
        libappindicator3-1 \
        lsb-release \
        xdg-utils \
        libu2f-udev \
        libvulkan1 \
        libgl1 \
        libgles2 \
        libnotify4 \
        libnspr4 \
    && rm -rf /var/lib/apt/lists/*

# Update and install basic packages (without nodejs/npm)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        wget \
        git \
        vim \
        nano \
        sudo \
        locales \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js (includes npm and npx) from NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install ts-node globally
RUN npm install -g ts-node typescript

# Install Tailscale
RUN curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.noarmor.gpg | tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null \
    && curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.tailscale-keyring.list | tee /etc/apt/sources.list.d/tailscale.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends tailscale \
    && rm -rf /var/lib/apt/lists/*

# Set the default locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Set the working directory
WORKDIR /workspace

# Make entrypoint script executable
RUN chmod +x /workspace/../entrypoint.sh

# Set entrypoint to start tailscaled and then run the main command
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
