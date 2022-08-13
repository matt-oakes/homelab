FROM alpine:3.16.2

# Install SSH deamon
RUN apk add --no-cache openssh-client

# Copy the cronjob file for the root user of the image
COPY --chown=root:root cronjobs /etc/crontabs/root
RUN chmod 0644 /etc/crontabs/root

# Copy the ssh key
COPY --chown=root:root ssh/identity /etc/sshid/identity
RUN chmod 0600 /etc/sshid/identity

# Copy the scripts for the image
COPY --chown=root:root run.sh /run.sh
COPY --chown=root:root entrypoint.sh /entrypoint.sh
RUN chmod +x /run.sh /entrypoint.sh
RUN chmod 0744 /run.sh

# Run the entrypoint script
ENTRYPOINT /entrypoint.sh
