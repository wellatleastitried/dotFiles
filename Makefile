.PHONY: all
all: check-dependencies install-files setup-env

.PHONY: check-dependencies
check-dependencies:
	@echo "Checking existing dependencies..."
	@./install/dependencies.sh

.PHONY: install-files
install-files: check-dependencies
	@echo "Installing files..."
	@./install/install.sh

.PHONY: setup-env
setup-env: install-files
	@echo "Setting up environment..."
	@./install/env.sh