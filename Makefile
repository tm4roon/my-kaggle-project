
setup:
	@/bin/sh ./scripts/setup_utils.sh
	@/bin/sh ./scripts/setup_python.sh
	@/bin/sh ./scripts/setup_docker.sh
	@/bin/sh ./scripts/setup_cuda.sh

clean:
	@/bin/sh ./scripts/clean_python.sh
	@/bin/sh ./scripts/clean_docker.sh
	@/bin/sh ./scripts/clean_cuda.sh
