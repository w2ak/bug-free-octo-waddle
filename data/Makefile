.PHONY: all

SQLFILES:=$(wildcard *.sql)
OUTFILES:=$(patsubst %.sql,%.out,$(SQLFILES))

all: $(OUTFILES)

%.out: %.sql
	time --output=$*.time psql inf553dp -f $*.sql > $@
