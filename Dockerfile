FROM arm64v8/ubuntu:focal

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && apt-get -q update && \
    apt-get -q install -y \
    curl \
    libxml2 \
    tzdata \
    gnupg2 \
    && rm -r /var/lib/apt/lists/*

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && curl -s https://packagecloud.io/install/repositories/swift-arm/release/script.deb.sh | bash && apt-get -q install -y swiftlang && apt-get upgrade -y && apt-get purge --auto-remove -y curl gnupg
