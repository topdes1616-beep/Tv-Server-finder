#!/bin/sh
set -e

GRADLE_VERSION="8.2"
GRADLE_DIST_URL="https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
GRADLE_HOME="${HOME}/.gradle/wrapper/dists/gradle-${GRADLE_VERSION}"
GRADLE_BIN="${GRADLE_HOME}/gradle-${GRADLE_VERSION}/bin/gradle"

if [ ! -f "$GRADLE_BIN" ]; then
    echo "Downloading Gradle ${GRADLE_VERSION}..."
    mkdir -p "$GRADLE_HOME"
    curl -fsSL "$GRADLE_DIST_URL" -o "${GRADLE_HOME}/gradle.zip"
    unzip -q "${GRADLE_HOME}/gradle.zip" -d "$GRADLE_HOME"
    rm -f "${GRADLE_HOME}/gradle.zip"
    echo "Gradle ${GRADLE_VERSION} ready."
fi

exec "$GRADLE_BIN" "$@"
