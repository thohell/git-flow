ROOT					:= $(shell pwd)
BIN						:= $(ROOT)/bin
PATH_MODULES 			:= $(ROOT)/modules

VERSION					= $(ROOT)/VERSION

# =============================================================================
# Module 'raid6_pq+'
# =============================================================================
MODULE_PQ_DIR			:= $(PATH_MODULES)/raid6_pq+
MODULE_PQ_SOURCES		:= $(wildcard $(MODULE_PQ_DIR)/*)
SOURCES					+=	$(MODULE_PQ_SOURCES)

# =============================================================================
# Module 'pqlibre'
# =============================================================================
MODULE_MD_DIR			:= $(PATH_MODULES)/pqlibre
MODULE_MD_SOURCES		:= $(wildcard $(MODULE_MD_DIR)/*)
SOURCES					+=	$(MODULE_MD_SOURCES)



$(info $(SOURCES))
$(info $(MODULE_MD_DIR))
$(info $(HERE))

build-modules: version.h
	@echo Building modules

$(VERSION): $(SOURCES)
	@echo "Creating VERSION"
	@echo "1.0.0-develop.1" > "$@"

version.h: $(VERSION)
	@echo "Creating version.h"
	@cat "$<" > "$@"
