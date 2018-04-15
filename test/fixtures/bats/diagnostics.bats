#load ../../test_helper

bats_print_diagnostic()
{
  echo "# $*" >&3
}

bats_print_diagnostic_test()
{
  # XXX: cannot get any test from here
  #wc -l $BATS_OUT
  #grep -F '# This is a diagnostic line' $BATS_OUT
  true
}

@test "bats_print_diagnostic" {
  bats_print_diagnostic "This is a diagnostic line"
  # Output should have TAP diagnostic line, a unixy comment line
  bats_print_diagnostic_test 
}
