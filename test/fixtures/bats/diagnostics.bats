@test "success test can turn on diagnostic output" {
  echo "success stdout 1"
  diag "success stdout 2"
  echo "success stdout 3"
}

@test "skipped test can have diagnostics turned on by hardwire" {
  echo "failure stdout 1"
  diag
  echo "failure stdout 2"
  skip
  echo "failure stdout 3"
}
