#!/bin/sh
# This script runs all tests in the "spec" directory


main() {
  script_dir=`dirname "$0"`
  test_root=`cd "${script_dir}"; pwd`
  unset "script_dir"
  cd spec
  pwd
  for spec in *; do
  echo "Testing ${spec}..."
  if ./"${spec}" "${test_root}"; then
    echo "SUCCESSFULL!"
  else
    echo "FAILED"
    exit 1;
  fi
done

  echo "All tests successfull!"
  exit 0
}

main "$@"
