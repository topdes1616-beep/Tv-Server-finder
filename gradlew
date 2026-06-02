#!/bin/sh
app_path=$0
while [ -h "$app_path" ] ; do
    ls=$( ls -ld "$app_path" )
    link=$( expr "$ls" : '.*-> \(.*\)$' )
    if expr "$link" : '/.*' > /dev/null; then
        app_path="$link"
    else
        app_path=$( dirname "$app_path" )/"$link"
    fi
done
APP_HOME=$( cd "$( dirname "$app_path" )" && pwd )
APP_BASE_NAME=$( basename "$app_path" )
DEFAULT_JVM_OPTS="-Xmx64m -Xms64m"
CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar
if [ -n "$JAVA_HOME" ] ; then
    JAVACMD="$JAVA_HOME/bin/java"
else
    JAVACMD="java"
fi
exec "$JAVACMD" \
    $DEFAULT_JVM_OPTS \
    $JAVA_OPTS \
    $GRADLE_OPTS \
    "-Dorg.gradle.appname=$APP_BASE_NAME" \
    -classpath "$CLASSPATH" \
    org.gradle.wrapper.GradleWrapperMain \
    "$@"
