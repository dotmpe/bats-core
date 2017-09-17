Bats: Bash Automated Testing System (fork)
============================================
:Version: 0.4.2-mpe
:CI status (master):
  .. image:: https://travis-ci.org/bvberkum/bats.svg?branch=master
:CI status (original sstephenson/bats):
  .. image:: https://travis-ci.org/bvberkum/bats.svg?branch=original

Forked to hack on:

1. easier diagnostics of BATS tests,
2. TODO/other TAP directive in addition to BATS' fail.

- TODO: option to toggle diagnostics
- TODO: new-tests.bats

Whishlist:
  - nested tests; (ie. extended TAP support)
  - bail out directive;

Work in progress:
- execution of selected tests only [f-run-index]


.. important::

   BATS official development has stalled and the backlog keeps growing.

   Please note `Call for Maintainers #150 <https://github.com/sstephenson/bats/issues/150>`__.

   Effectively the official BATS will be stalled at 0.4.0 and locked until
   someone solves 1.0 by going through the backlog.


Before presenting a upstream merge request based on my additions, I'd like to
see extending BATS resolved somehow.
E.g. <https://github.com/ztombol/bats-docs>.


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

