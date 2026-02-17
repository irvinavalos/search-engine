APP = dex

all: core interface

core:
	@echo "Building C++ core"
	$(MAKE) -C core


interface:
	@echo "Building Python env with uv"
	@cd interface && uv sync

run:
	@echo "Running application"
	@cd interface && uv run python -m $(APP)

.PHONY: all run core interface
