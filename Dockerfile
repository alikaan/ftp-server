# Use an official Ubuntu base image
FROM ubuntu:latest

# Install vsftpd and other necessary packages
RUN apt-get update && apt-get install -y vsftpd

# Create FTP directory and set permissions
RUN mkdir -p /home/ftpuser/ftp/upload && \
    chown -R nobody:nogroup /home/ftpuser/ftp && \
    chmod a-w /home/ftpuser/ftp && \
    chmod 777 /home/ftpuser/ftp/upload

# Add FTP user
RUN useradd -m ftpuser && echo "ftpuser:password" | chpasswd

# Copy vsftpd configuration
COPY vsftpd.conf /etc/vsftpd.conf

# Expose necessary ports (FTP default and passive ports)
EXPOSE 20 21 30000-30009

# Start vsftpd
CMD ["vsftpd", "/etc/vsftpd.conf"]