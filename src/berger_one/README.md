# 🧠 Berger B1-Protected Memory System

This project implements a **Berger B1 code** scheme for protecting memory from **unidirectional 1->0 bit-flip faults** in hardware using Verilog. It features:

* Berger(12,8) encoding and decoding logic
* A simple memory model that stores encoded data
* A unidirectional fault injector to simulate 1->0 bit-flips only
* A decoder that can **detect unidirectional errors** (no correction)
* A comprehensive testbench for functional verification

---

## 📘 Berger Code: Overview

Berger codes are **unidirectional error detection codes** that count the number of ones bits in the data and encode that count in binary as redundant bits. They are well-suited to detect faults that cause bits to flip only in one direction (e.g., 1->0). 

In B1 code you may notice we take complement of number of ones. This is to ensure 1->0 errors are caught. If we have a 1->0error in the data, the sum goes down, however we could also have a 1->0 error in out sum bits which would cancel out the error. Hence, taking complement ensures that the sum would go up and thus multiple 1->0 errors are also caught.

We use the **Berger(12,8)** configuration:

### Parity Bit Positions (Berger(12,8)):

| Bit Index | 11 | 10 | 9  | 8  | 7  | 6  | 5  | 4  | 3  | 2  | 1  | 0  |
| --------- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| Contents  | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0 | B3 | B2 | B1 | B0 |

* `D0–D7`: Data bits
* `B3-B0`: Berger code bits representing the complement of count of ones bits in the data

---

## 📂 Project Structure

```
.
├── src/
│   └── berger_one/
│       ├── berger_one_encoder.v           # 8-bit to 12-bit Berger encoder
│       ├── berger_one_decoder.v           # Decoder with unidirectional error detection
│       ├── mem_berger_one.v               # Simple 12-bit memory model
│       ├── unidirectional_error.v         # Fault injector for 1->0 bit flips only
│       ├── berger_one_memory.v            # Memory wrapper (normal)
│       └── berger_one_faulty_memory.v     # Memory wrapper with fault injection
│
├── tb/
│   └── berger_one_tb.v                    # Testbench with functional scenarios
│
├── images/
│   ├── berger_one_memory.png              # Diagram of normal memory
│   └── berger_one_faulty_memory.png       # Diagram with unidirectional fault injection
│
└── README.md
```

---

## 🧠 Architecture Diagrams

### ✅ Berger B1 Memory

![Berger B1 Memory](../../images/berger_one_memory.png)

### ✅ Berger B1 Faulty Memory

![Berger B1 Faulty Memory](../../images/berger_one_faulty_memory.png)

---

## 🔩 Key Modules

### 🔹 `berger_one_encoder`

* Inputs: `input_data [7:0]`
* Output: `output_code [11:0]`
* Counts ones in data and appends complemented binary ones-count (4 bits) as Berger code.

### 🔹 `berger_one_decoder`

* Input: `in_code [11:0]`
* Outputs: `out_data [7:0]`, `error_detected`
* Checks if the complement of one count in data matches the appended Berger code bits.
* Detects unidirectional errors (1->0), no correction.

### 🔹 `mem_berger_one`

* Synchronous memory module storing 12-bit Berger codewords.

### 🔹 `unidirectional_error`

* Injects unidirectional 1->0 errors at specified bits when enabled.

### 🔹 `berger_one_memory`

* Top-level module: encoder + memory + decoder without fault injection.

### 🔹 `berger_one_faulty_memory`

* Includes `unidirectional_error` fault injector before decoder.

---

## ✅ Features Tested

* Correct encoding and decoding of 8-bit data with Berger code
* Unidirectional fault injection (1->0) at any bit in the 12-bit codeword
* Error detection for multiple simultaneous 1->0 bit-flips
* Memory write/read cycles with and without faults
* Latch-free, fully synthesizable Verilog code
* Waveform verification for visual inspection

---

## 🚀 Future Extensions

* Implement Bidirectional Berger codes for broader error detection
* Add error correction capabilities or combine with other ECC schemes
* Parameterize bit-width for general Berger code support
* Formal verification with SystemVerilog Assertions (SVA)
* Integration into larger memory subsystems with ECC support

---

## 🛠️ Usage (Vivado)

1. Open Vivado and create a new project
2. Add all files from `src/berger_one/` as sources
3. Add `berger_one_tb.v` from `tb/` as simulation source
4. Run simulation to observe error detection behavior with/without faults
5. Use waveform viewer to analyze encoding, fault injection, and detection signals

---

## 📜 License

Licensed under the **MIT License** – free to use, modify, and distribute.

---

## 🤝 Contributions

Pull requests, feature additions, and bug reports are welcome.
Let me know if you'd like to contribute diagrams, testbenches, or extensions!
