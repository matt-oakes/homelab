# HomeLab

The configuration for the homelab services that are designed to run on a Raspberry Pi on the local network. The different services are configured and run through makesure which will ensure the correct dependencies are installed and configured.

## Requirements

- Raspberry Pi setup with Raspbian
- Internet connection

## Configuring the services

Make a copy of `.env.example` called `.env` and fill in the secrets with the correct values.

## Running the services

Clone the confguration onto the host Raspberry Pi, go into the directory and run:

```
./makesure
```

The required dependencies will be installed and the services will be configured and started and will run until they are stopped with:

```
docker-compose down
```

## Configured services

### Caddy

Caddy is configured as a HTTP(S) server that sits in from of all of the other services. It handles certificate creation and renewal using the Cloudflare DNS API and reverse proxys requests to the other services.

### Unifi Controller

Used to manage the networking hardware on the local network.

After it is set up on a new network you need to go into the settings and override the "Inform host" to be the local IP address of the Raspberry Pi that these services are running on. This is needed to allow adoption of network hardware to work correctly.

### Pihole

Used to run a local DNS cache which also handles the routing to the internal only domains for all the services, via Caddy.

We also configure it to block domains on an adlist for just some clients to avoid disruption.

### Wireguard VPN Server

Used to remotely connect to the internal home network from anywhere else.

The peers are configured via the comma seperated `WIREGUARD_SERVER_PEERS` environment variable and the connection details and QR code can be viewed by running:

```
docker exec -it wireguard_server /app/show-peer peer_name_here
```

### Prometheus & Grafana

Used to collect and display dashboards for data collected on the network.

There are also containers that are used to collect stats about the Pi itself (such as load information) and a speed test container which allows displaying historic details about regular speed tests which are run to monitr the internet connection.
