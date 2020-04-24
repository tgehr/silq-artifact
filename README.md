Artifact for PLDI'20 paper #431 
===============================

Silq is a high-level quantum programming language, described in the paper "Silq: A High-level Quantum Language with Safe Uncomputation and Intuitive Semantics".

We tested the instructions under Ubuntu 19.10, but we expect the results to be reproducible on OSX as well as using the linux subsystem for Windows. (Building natively on Windows is possible, but not directly supported with the provided build scripts.)

Artifact contents
-----------------

- Source code and test cases (directory `silq`), cloned from the official Silq repository at https://github.com/eth-sri/silq. Silq is written in the D programming language.

- Example code used in the paper (directory `examples`).

- Code of solutions to quantum tasks on codeforces as described in the paper (directory `silq/test/codeforces`).

- Script used to create summary tables (`silq/test/codeforces/stats/counting.py`).


Building from source
--------------------

To build from source (either linux or OSX):

- run `./dependencies-release.sh` in the `silq` directory to download a compatible D compiler (LDC). (Requires wget; this step is required only once.)

- run `./build-release.sh`. (This step is required for every rebuild.)


To create a debug build that builds fast but runs slower, omit `-release` from the above commands. (This will use DMD instead of LDC.)

Type checking and running examples
----------------------------------

Each file includes a command that can be used to typecheck and run it from within the directory.

- Figure 1: see `examples/uncomputeOr.slq`
- Figure 2: see `examples/plusEq.slq`
- Figure 5: see `examples/invalid.slq` (this file does not type check and produces the errors reported in Figure 5).

- Figures 3, 17: see `examples/grover.slq` (includes an example of usage).
- Figure 18: see `examples/periodFinding.slq` (includes an example of usage).

For more examples of Silq code, see the directory `silq/test`, which contains the current set of tests for our implementation of Silq. For example `silq/test/testQFT.slq` confirms that `reverse(QFT[3])(QFT(0:int[3]));` produces |0⟩ for the QFT implementation from `silq/test/qft.slq`.)

Recreating summary tables
-------------------------

The summary tables from appendix G are provided in the following files:

```
silq/test/codeforces/summer18/contest/eval.tex
silq/test/codeforces/winter19/contest/eval.tex
silq/test/codeforces/stats/top10submissions/winter19/evals/*.tex
silq/test/codeforces/stats/top10submissions/summer18/evals/*.tex

```

Run the following script (provided as `make-tables.sh`) to create those files from scratch (this can take a while):

```
cd 'silq/test/codeforces/stats'
python3 counting.py -path '../summer18/contest/'
python3 counting.py -path '../winter19/contest/'
python3 counting.py -path './top10submissions/winter19/'
python3 counting.py -path './top10submissions/summer18/'
```
