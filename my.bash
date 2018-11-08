#!/bin/bash

my-data()
{
  echo $*
}

my-lines()
{
  while read -r $line
  do
    bats_encode_test_name "$1: $line" 'encoded_name'
    echo $encoded_name
  done
}
