docker run  -d  --publish 80:8080 \
	--volume ~/magic_mirror/config:/opt/magic_mirror/config \
	--volume ~/magic_mirror/modules:/opt/magic_mirror/modules \
	--name magic_mirror_clean \
	docker-magicmirror-mqtt
