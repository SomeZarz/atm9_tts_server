# Use the specified Eclipse Temurin JRE image based on UBI 9 Minimal
FROM eclipse-temurin:17.0.15_6-jre-ubi9-minimal

# Set a working directory for the application inside the container
# Subsequent commands like COPY, RUN, CMD, ENTRYPOINT will be relative to this path
WORKDIR /code

# Copy the 'src' directory from your host machine (build context)
# into the '/app/src' directory inside the container.
# This means your local 'src/run.sh' will be at '/app/src/run.sh' in the image.
COPY src ./src/

# Make the 'run.sh' script executable.
# The ubi9-minimal image has 'sh', so ensure your run.sh script
# starts with a shebang like '#!/bin/sh' or '#!/bin/bash' if bash is available and needed.
# The chmod command makes the script executable.
RUN chmod +x ./src/run.sh

# Inform Docker that the container listens on port 25565 at runtime.
# This is documentation; you still need to map this port when running the container (e.g., using 'docker run -p').
EXPOSE 25565

# Set the command to run when the container starts.
# This will execute the '/app/src/run.sh' script.
# Using the exec form (JSON array) is generally recommended.
ENTRYPOINT ["./src/run.sh"]
