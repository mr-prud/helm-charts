mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(abspath $(patsubst %/,%,$(dir $(mkfile_path))))

.PHONY: test
test: test-lint

.PHONY: test-lint
test-lint:
	docker run  --rm  --name ct "--volume=$(current_dir):/workdir" "--workdir=/workdir" quay.io/helmpack/chart-testing ct lint --all --target-branch main

.PHONY: init-google-sync-config
init-google-sync-config:
	
	docker run --rm -ti --name google-photo-sync-init --volume=$(current_dir)/config:/config --volume=$(current_dir)/storage:/storage gilesknap/gphotos-sync:2.14.2 /storage

.PHONY: kind-test
kind-test: 
	kind create cluster --nmae=kind-chart-testing

.PHONY: helm-test
helm-test: kind-test
	helm dependency build charts/google-photos-sync 
