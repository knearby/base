USER_ID=$$(id -u $$(whoami))

init.docker:
	$(MAKE) prereq.docker
	USER_ID=${USER_ID} docker-compose -f ./docker/docker-compose.yml up -d -V

init.k8s:
	$(MAKE) prereq.k8s
	$(MAKE) prereq.docker
	$(MAKE) log.info MSG="Restarting virtualbox..."
	@sudo /sbin/rcvboxdrv restart
	@minikube delete
	$(MAKE) log.info MSG="Starting MiniKube cluster..."
	@minikube start
	@minikube status

prereq.k8s:
	@(which minikube && $(MAKE) log.info MSG="minikube found." && minikube version) || \
		( \
			$(MAKE) log.error MSG="minikube not found in your path.\n  - visit https://github.com/kubernetes/minikube/releases/tag/v0.28.2/ and download the appropriate version." \
			&& exit 1 \
		)
	@(which kubectl && $(MAKE) log.info MSG="kubectl found." && kubectl version --client) || \
		( \
			$(MAKE) log.error MSG="kubectl not found in your path.\n  - visit https://kubernetes.io/docs/tasks/tools/install-kubectl/ and follow the instructions there." \
			&& exit 1 \
		)

prereq.docker:
	@(which docker && printf -- "\033[32m\033[1m\nINFO: docker found.\033[0m\n\n" && docker version) || \
		( \
			$(MAKE) log.error MSG="docker not found in your path.\n  - visit https://store.docker.com/search?q=community%20edition&type=edition&offering=community and download the appropriate version.\033[0m\n\n" \
			&& exit 1 \
		)

log.error:
	@printf -- "\n\033[31m\033[1mERR: ${MSG}\033[0m\n\n"

log.info:
	@printf -- "\n\033[32m\033[1mINFO: ${MSG}\033[0m\n\n"