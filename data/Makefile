.PHONY: all imports clean

SQLFILES:=$(shell find -maxdepth 1 -type f -name '*.sql' -not -name '*_better.sql')
OUTFILES:=$(patsubst %.sql,%.out,$(SQLFILES))
EXPFILES:=$(patsubst %.sql,%.explain,$(SQLFILES))
AUXFILES:=$(shell find -type f -name '*.sql*') $(shell find -type f -name '*.time') $(find -type f -name '*.improved') Makefile

all: $(OUTFILES) q1.explain q8.explain q2.improved q7.improved

%.out: %.sql
	time --output=$*.time psql inf553dp -f $< > $@

%.explain: %.sql
	cat $< | sed '1 s/^/EXPLAIN /' | psql inf553dp > $@

%.improved: %_better.sql %.sqlimprove %.sqlnormal %.explain
	psql inf553dp -f $*.sqlimprove
	cat $< | sed '1 s/^/EXPLAIN /' | psql inf553dp > $@
	psql inf553dp -f $*.sqlnormal

clean:
	find -type f -name '*.exp' -delete
	find -type f -name '*.out' -delete
	find -type f -name '*.time' -delete
	rm -f handout.tar

imports:
	rm -f imports/*.sql
	./.makeimports
	cat imports/*.sql | sed -n '/^DROP/ p;' > imports/drops.tmp
	echo "VACUUM;" >> imports/drop.tmp
	cat imports/*.sql | sed '/^DROP/ d;' > imports/create.tmp
	cat imports/drops.tmp imports/create.tmp > imports/import.sql
	rm -f imports/*.tmp

handout.tar: all
	tar cvf $@ description.md
	tar uvf $@ Makefile
	tar uvf $@ $(SQLFILES)
	tar uvf $@ $(OUTFILES)
	tar uvf $@ q1.explain q8.explain q2.improved q7.improved q2.explain q7.explain
