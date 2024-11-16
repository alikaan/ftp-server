# ftp-server

This project sets up an FTP server using `vsftpd` on an Ubuntu base image. Follow the instructions below to build the Docker image and run a new instance.

## Prerequisites

- Docker installed on your machine

## Building the Docker Image

1. Open a terminal and navigate to the directory containing the `Dockerfile`.

2. Build the Docker image using the following command:

    ```sh
    docker build -t ftp-server .
    ```

    This command will create a Docker image named `ftp-server`.

## Running a New Instance

1. Run a new container instance from the `ftp-server` image using the following command:

    ```sh
    docker run -d -p 20:20 -p 21:21 -p 30000-30009:30000-30009 --name ftp-server-instance ftp-server
    ```

    This command will start a new container named `ftp-server-instance` and map the necessary FTP ports.

2. Verify that the container is running:

    ```sh
    docker ps
    ```

    You should see `ftp-server-instance` listed in the output.

## Accessing the FTP Server

- You can now connect to the FTP server using an FTP client. Use the following credentials:

    - **Username:** ftpuser
    - **Password:** password

- The FTP directory is located at `/home/ftpuser/ftp/upload`.

## Stopping the Container

To stop the running container, use the following command:

```sh
docker stop ftp-server-instance
```

## Removing the Container

To remove the stopped container, use the following command:

```sh
docker rm ftp-server-instance
```

## Additional Configuration

- The FTP server configuration is defined in the [`vsftpd.conf`](vsftpd.conf) file. You can modify this file to change the server settings.
- After making changes to the [`vsftpd.conf`](vsftpd.conf) file, rebuild the Docker image and restart the container to apply the changes.

For more information on [`vsftpd`](https://security.appspot.com/vsftpd.html) configuration, refer to the official documentation.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.