// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.

namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Diagnostics;
    
    operation Solve (qs : Qubit[]) : Unit {
        let l = Length(qs);

        for (q in qs[1..l-1]) {
            CNOT(qs[0], q);
        }

        H(qs[0]);
        
        for (q in qs[1..l-1]) {
            CNOT(qs[0], q);
        }

        (Controlled SWAP)([qs[0]], (qs[1], qs[2]));
        ApplyToEach(X, qs);
        
        (Controlled H)([qs[1], qs[2]], qs[0]);

        X(qs[1]);
        X(qs[2]);
        (Controlled H)([qs[1], qs[2]], qs[0]);

        X(qs[1]);
        X(qs[2]);
    }

    // operation DumpUnitaryToFiles (N : Int, unitary : (Qubit[] => Unit)) : Unit {
    //     let size = 1 <<< N;
        
    //     using (qs = Qubit[N]) {
    //         for (k in 0 .. size - 1) {                
    //             // Prepare k-th basis vector
    //             let binary = BoolArrFromPositiveInt(k, N);
                
    //             //Message($"{k}/{N} = {binary}");
    //             // binary is little-endian notation, so the second vector tried has qubit 0 in state 1 and the rest in state 0
    //             ApplyPauliFromBitString(PauliX, true, binary, qs);
                
    //             // Apply the operation
    //             Solve(qs);
                
    //             // Dump the contents of the k-th column
    //             DumpMachine($"DU_{N}_{k}.txt");
                
    //             ResetAll(qs);
    //         }
    //     }
    // }

    // // The operation which is called from C# code
    // operation CallDumpUnitary (N : Int) : Unit {
    //     // make sure the operation passed to DumpUnitaryToFiles matches the number of qubits set in Driver.cs
    //     let unitary = ApplyToEach(I, _);

    //     DumpUnitaryToFiles(N, unitary);
    // }
}
