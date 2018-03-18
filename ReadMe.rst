Bats: Bash Automated Testing System (fork)
============================================
:Version: 0.4.0-bvb5
:CI status (master):
  .. image:: https://travis-ci.org/bvberkum/bats.svg?branch=master
:CI status (original sstephenson/bats):
  .. image:: https://travis-ci.org/bvberkum/bats.svg?branch=original


Whishlist:
  - nested tests; (ie. extended TAP support)
  - bail out directive;

Done and tested:
  - Execution of selected tests only, based on number [f-run-index]
  - Added TODO test state and command.
  - Added `fail` and `diag` test helpers.
  - Option to toggle diagnostics without hardcoded 'diag' call.


Want to add more test helpers, but need to see ideas on separately packaged
extensions to BATS first.


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

features/duplicate-test-warning
  Thinking about way to warn about duplicate tests.
  FIXME: proper solution needs profiling, impact should be evaluated. Otherwise
  some optimization, perhaps through preprocessing bats before install; making
  code like this optional.

  Don't want to slow down bats any more.

features/mbland-optimized
  Optimizations merged with master.

  Issues: 'hidden' string positions after test description do not work anymore.



