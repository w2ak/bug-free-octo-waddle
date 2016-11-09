.PHONY: info short sql shortsql
CSV:=$(wildcard *.csv)

all: info short shortsql

info: $(patsubst %.csv,%.info,$(CSV))

%.info: %.csv
	./makeinfo $< > $@

short: $(patsubst %.csv,%.short,$(CSV))

%.short: %.csv
	./makeshort $< > $@

sql: $(patsubst %.csv,%.sql,$(CSV))

%.sql: %.csv
	./makesql $< > $@

shortsql: $(patsubst %.csv,%.shortsql,$(CSV))

%.shortsql: %.short
	./makesql $< > $@
