fixtures() {
  FIXTURE_ROOT="$BATS_TEST_DIRNAME/fixtures/$1"
  bats_trim_filename "$FIXTURE_ROOT" 'RELATIVE_FIXTURE_ROOT'
}

setup() {
  export TMP="$BATS_TEST_DIRNAME/tmp"
}

filter_control_sequences() {
  "$@" | sed $'s,\x1b\\[[0-9;]*[a-zA-Z],,g'
}

if ! command -v tput >/dev/null; then
  tput() {
    printf '1000\n'
  }
  export -f tput
fi

emit_debug_output() {
  printf '%s\n' 'output:' "$output" >&2
}

teardown() {
  [ -d "$TMP" ] && rm -f "$TMP"/*
}

# Add fallbacks for non-std BATS functions

type fail >/dev/null 2>&1 || {
  fail()
  {
    test -z "$1" || echo "Reason: $1" >> $BATS_OUT
    exit 1
  }
}

type diag >/dev/null 2>&1 || {
  # Note: without failing test, output will not show up in std Bats install
  diag()
  {
    BATS_TEST_DIAGNOSTICS=1
    echo "$1" >>"$BATS_OUT"
  }
}

type TODO >/dev/null 2>&1 || { # tasks:no-check
  TODO() # tasks:no-check
  {
    test -n "$TODO_IS_FAILURE" && {
      ( 
          test -z "$1" &&
              "TODO ($BATS_TEST_DESCRIPTION)" || echo "TODO: $1"  # tasks:no-check
      )>> $BATS_OUT
      exit 1
    } || {
      # Treat as skip
      BATS_TEST_TODO=${1:-1}
      BATS_TEST_COMPLETED=1
      exit 0
    }
  }
}

type stdfail >/dev/null 2>&1 || {
  stdfail()
  {
    test $# -gt 0 || set -- ""
    test -n "$1" || set -- "Unexpected. Status"
    fail "$1: $status, output(${#lines[@]}) is '${lines[*]}'"
  }
}

fnmatch() # Glob Str
{
  case "$2" in $1 ) return 0 ;; *) return 1 ;; esac
}
