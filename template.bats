#!/usr/bin/env bats

# See libexec/bats-core/bats-preprocess-2

@test "My test name" {

  true
}

@test "My test name" "String 2" "String 3" 4 {

  true
}


testf=tpl-data.txt

@test:line<$testf "Foreach $line" {

  run echo $line
  test "${lines[0]}" = "$line"
}


# ..
