#!/bin/sh

set -e

export BATS_TEST_PATTERN="^[[:blank:]]*@test[[:blank:]]+(.*[^[:blank:]])[[:blank:]]+\{(.*)\$"
export BATS_TEST_FILTER=

./libexec/bats-core/bats-preprocess < template.bats

exit $?

for x in libexec/bats-core/*
do
  echo $x
  ~/project/oil/bin/osh -n --ast-format command-names "$x" | sort -u | while read -r xname
do
  test -e libexec/bats-core/$xname && continue

  {
    cat libexec/bats-core/* | grep -q "$xname"
  } && {
    # func
    echo "$xname()"

  } || {
    X=$(which "$xname")
    test -x "$X" && {
      # cmd
      echo "$xname*"

    } || {
      echo "Expected X '$xname'"
    }
  }

done

  echo
done
exit $?

exit $?


docker run -ti --rm \
  -v $(pwd -P):/srv/dut \
         bvberkum/treebox \
         bash

