THESIS_DIR = ./thesis

.PHONY: thesis cleanall

thesis:
	make -C $(THESIS_DIR) thesis

cleanall:
	make -C $(THESIS_DIR) cleanall

