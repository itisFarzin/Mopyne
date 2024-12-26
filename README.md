
# Mopyne

My personal Mopidy Docker container on Alpine

## Features

- Mopidy-MPD
- Mopidy-YouTube
- Mopidy-Local
- Mopidy-Iris

## How to use it

1. **Clone the Repository**

   ```bash
   git clone https://github.com/itisFarzin/Mopyne.git
   cd Mopyne
   ```

2. **Build the Docker Image**

   Build the container using the provided Dockerfile:

   ```bash
   docker build -t mopyne .
   ```

3. **Run the Container**

   Start the container with the following command:

   ```bash
   docker run -d \
     -name mopyne \
     -p 6600:6600 \  # MPD port
     -p 6680:6680 \  # Iris web interface port
     -v /path/to/config:config \  # Your own mopidy config folder path
     -v /path/to/tracks:/tracks \  # Your own track folder path
     mopyne
   ```

4. **Access the Services**

   - **Iris Web Interface**: Open your browser and go to `http://<host-ip>:6680/iris`.
   - **MPD Clients**: Connect to `<host-ip>` on port `6600` using an MPD client of your choice.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
