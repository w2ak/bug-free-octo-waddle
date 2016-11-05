.PHONY: all
CSV:=$(wildcard *.csv)

all: $(patsubst %.csv,%.info,$(CSV))

%.info: %.csv
	./makeinfo $< > $@

%.sql: %.csv
	./makesql $< > $@
