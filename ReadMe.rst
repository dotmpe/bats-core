Bats: Bash Automated Testing System (fork)
============================================
:Version: 0.4.1-mpe

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


-----

- Original ReadMe__

.. __: README.md


Branch Docs
-----------

f_run_index
  - Hacked first version of run-at-index (0.4.0). Only run desired tests.
    Index starts at 0. Ranges are given as '<from>-<to>'.
    Multiple positions or ranges are added separated by ','.

f_list
  Added -l flag.

