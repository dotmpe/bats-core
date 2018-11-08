#!/usr/bin/env bats

# See libexec/bats-core/bats-preprocess-2

@test "My test name" {

  true
}

@test "My test name" "String 2" "String 3" {

  true
}

@test "My test name" "String 2" 3 true 0.0005 {

  true
}


@test:each:item "Builtin outline support I" "Item 1" "Item 2" "Item 3" {

  run echo "$item"
  test "${lines[*]}" = "Item 1" ||
  test "${lines[*]}" = "Item 2" ||
  test "${lines[*]}" = "Item 3"
}


# XXX: Static context makes a data-provider (to run at pre-proc time) a bit
# limited. Best keep to a limited @*.... { ... } syntax language. Current
# transform strategy is to rewrite only @-line part, and append some
# registration calls after flushing the entire script

#@preload my-data

load my

@test:outline:'my-data tpl-data.txt' "Builtin outline support II.a" {

  run echo "$line"
  test "${lines[*]}" = "some line"
} 

# XXX:

@test:outline:'my-data tpl-data.txt':first:second "Builtin outline support II.b" {

  run echo "$first:$second"
  test "${lines[*]}" = "some:line"
}

@test:outline:f:s:'my-data tpl-data.txt' "Builtin outline support II.c" {

  run echo "$f:$s"
  test "${lines[*]}" = "some:line"
}

# ..
