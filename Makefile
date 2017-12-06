TAG=gcr.io/tmbmicro

image: pytorch2.7
	docker build -t docker-pytorch-base ./docker-pytorch-base
	-cp vnc-password docker-pytorch/homedir/.vnc/passwd
	-cp ssh-authorized docker-pytorch/homedir/.ssh/authorized_keys
	mkdir -p docker-pytorch/extras
	touch docker-pytorch/extras-install && chmod 755 docker-pytorch/extras-install
	-(cd docker-pytorch && test -f extras-fetch && ./extras-fetch)
	docker build --no-cache -t docker-pytorch ./docker-pytorch

upload: image
	docker tag pytorch2.7 ${TAG}/pytorch2.7
	gcloud docker -- push ${TAG}/pytorch2.7
	docker tag docker-pytorch-base ${TAG}/docker-pytorch-base
	gcloud docker -- push ${TAG}/docker-pytorch-base
	docker tag docker-pytorch ${TAG}/docker-pytorch
	gcloud docker -- push ${TAG}/docker-pytorch

pytorch2.7:
	docker build -t pytorch2.7 ./pytorch2.7

rebuild-pytorch2.7:
	docker build --no-cache -t pytorch2.7 ./pytorch2.7

rebuild:
	docker build --no-cache -t docker-pytorch-base ./docker-pytorch-base

clean-docker:
	-docker container prune -f
	-docker image prune -f
	-docker rmi docker-pytorch
	-docker rmi docker-pytorch-base

