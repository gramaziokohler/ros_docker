USERNAME=gramaziokohler
VERSION=$(shell cat VERSION)

# We need to check if we're running inside WSL (Bash on Windows) or real bash
DOCKER=docker
PROCESS_VERSION=$(grep -o Microsoft /proc/version | head -n 1)
ifeq ($(words PROCESS_VERSION), 1)
	DOCKER='docker.exe'
endif

.PHONY: all build

all: build

build: build-ros-base build-novnc build-ros-abb-planner build-ros-ur-planner build-ros-panda-planner build-ros-rfl-planner build-ros-kuka-iiwa-planner

build-ros-base:
	$(eval IMAGE:=ros-base)
	@echo 'Building $(IMAGE) image, version $(VERSION)'
	@cd $(IMAGE);$(DOCKER) build --rm -t $(USERNAME)/$(IMAGE):$(VERSION) -t $(USERNAME)/$(IMAGE):latest .
	@echo \\n****************************************************************\\n

build-novnc:
	$(eval IMAGE:=novnc)
	@echo 'Building $(IMAGE) image, version $(VERSION)'
	@cd $(IMAGE);$(DOCKER) build --rm -t $(USERNAME)/$(IMAGE):$(VERSION) -t $(USERNAME)/$(IMAGE):latest .
	@echo \\n****************************************************************\\n

build-ros-abb-planner:
	$(eval IMAGE:=ros-abb-planner)
	@echo 'Building $(IMAGE) image, version $(VERSION)'
	@cd $(IMAGE);$(DOCKER) build --rm -t $(USERNAME)/$(IMAGE):$(VERSION) -t $(USERNAME)/$(IMAGE):latest .
	@echo \\n****************************************************************\\n

build-ros-ur-planner:
	$(eval IMAGE:=ros-ur-planner)
	@echo 'Building $(IMAGE) image, version $(VERSION)'
	@cd $(IMAGE);$(DOCKER) build --rm -t $(USERNAME)/$(IMAGE):$(VERSION) -t $(USERNAME)/$(IMAGE):latest .
	@echo \\n****************************************************************\\n

build-ros-panda-planner:
	$(eval IMAGE:=ros-panda-planner)
	@echo 'Building $(IMAGE) image, version $(VERSION)'
	@cd $(IMAGE);$(DOCKER) build --rm -t $(USERNAME)/$(IMAGE):$(VERSION) -t $(USERNAME)/$(IMAGE):latest .
	@echo \\n****************************************************************\\n

build-ros-rfl-planner:
	$(eval IMAGE:=ros-rfl-planner)
	@echo 'Building $(IMAGE) image, version $(VERSION)'
	@cd $(IMAGE);$(DOCKER) build --rm -t $(USERNAME)/$(IMAGE):$(VERSION) -t $(USERNAME)/$(IMAGE):latest .
	@echo \\n****************************************************************\\n

build-ros-kuka-iiwa-planner:
	$(eval IMAGE:=ros-kuka-iiwa-planner)
	@echo 'Building $(IMAGE) image, version $(VERSION)'
	@cd $(IMAGE);$(DOCKER) build --rm -t $(USERNAME)/$(IMAGE):$(VERSION) -t $(USERNAME)/$(IMAGE):latest .
	@echo \\n****************************************************************\\n

release: release-ros-base release-novnc release-ros-abb-planner release-ros-ur-planner release-ros-panda-planner release-ros-rfl-planner release-ros-kuka-iiwa-planner

release-ros-base:
	$(eval IMAGE:=ros-base)
	@echo 'Publishing $(IMAGE) image to dockerhub'
	@$(DOCKER) push $(USERNAME)/$(IMAGE)

release-novnc:
	$(eval IMAGE:=novnc)
	@echo 'Publishing $(IMAGE) image to dockerhub'
	@$(DOCKER) push $(USERNAME)/$(IMAGE)

release-ros-abb-planner:
	$(eval IMAGE:=ros-abb-planner)
	@echo 'Publishing $(IMAGE) image to dockerhub'
	@$(DOCKER) push $(USERNAME)/$(IMAGE)

release-ros-ur-planner:
	$(eval IMAGE:=ros-ur-planner)
	@echo 'Publishing $(IMAGE) image to dockerhub'
	@$(DOCKER) push $(USERNAME)/$(IMAGE)

release-ros-panda-planner:
	$(eval IMAGE:=ros-panda-planner)
	@echo 'Publishing $(IMAGE) image to dockerhub'
	@$(DOCKER) push $(USERNAME)/$(IMAGE)

release-ros-rfl-planner:
	$(eval IMAGE:=ros-rfl-planner)
	@echo 'Publishing $(IMAGE) image to dockerhub'
	@$(DOCKER) push $(USERNAME)/$(IMAGE)

release-ros-kuka-iiwa-planner:
	$(eval IMAGE:=ros-kuka-iiwa-planner)
	@echo 'Publishing $(IMAGE) image to dockerhub'
	@$(DOCKER) push $(USERNAME)/$(IMAGE)
