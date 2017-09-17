Bats: Bash Automated Testing System (fork)
============================================
Forked to hack on:

1. easier diagnostics of BATS tests,
2. TODO/other TAP directive in addition to Bats' fail.

- TODO: option to toggle diagnostics
- TODO: new-tests.bats

Whishlist:
- nested tests;
- bail out directive;

Work in progress:
- execution of selected tests only [f-run-index]


.. important::

   BATS official development is has stalled and the backlog keeps growing.

   Please note `Call for Maintainers #150 <https://github.com/sstephenson/bats/issues/150>`__.


Before presenting a upstream merge request based on my additions, I'd like to
see extending BATS resolved somehow. E.g. <https://github.com/ztombol/bats-docs>

-----

- Original ReadMe__

.. __: README.md


Branch Docs
-----------
master
  - 0.4.0

f_run_index
  - Hacked first version of run-at-index (0.4.0). Only run desired tests.
    Index starts at 0. Range not supported yet.

    TODO: filter BATS_TEST_NAMES[] array using indices. Then look at creating
    unified output report.

    Done. Now have to refactor to move skipping to bats_test_begin.
    Fix some protocol issues. Testing.

