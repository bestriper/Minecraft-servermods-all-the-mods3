All the Mods 3 - Docker Server
==============================

Dockerfile for Minecraft ATM-3 Server

To simply use the latest stable version, run:

Run with:

```bash
docker run -d \
	-p 25565:25565 \
	-v /local/path/to/world:/minecraft/world \
	bestriper/minecraft-servermods-all-the-mods3
```
where the default server port, 25565, will be exposed on your host machine. If you want to serve up multiple Minecraft servers or just use an alternate port, change the host-side port mapping such as:

```bash
docker run -p 25566:25565 ...
```
will service port 25566