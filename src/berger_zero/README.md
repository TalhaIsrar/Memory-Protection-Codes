# 🧠 Berger B0-Protected Memory System


---

## 📘 Berger Code: Overview

We use the **Berger B0** configuration:

### Parity Bit Positions (Berger(12,8)):

| Bit Index | 11 | 10 | 9  | 8  | 7  | 6  | 5  | 4  | 3  | 2  | 1  | 0  |
| --------- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| Contents  | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0 | B3 | B2 | B1 | B0 |

* `D0–D7`: Data bits
* `B3-B0`: Berger Code sum of zeros

---

## 📂 Project Structure

```
.
├── src/
│   └── berger_zero/
│       ├── berger_zero_encoder.v           # 8-bit to 12-bit Berger encoder
│       ├── berger_zero_decoder.v           # Decoder with unidirectional detection
│       ├── mem_berger_zero.v               # Simple 12-bit memory model
│       ├── unidirectional_error.v          # Fault injector for unidirectional error
│       ├── berger_zero_memory.v            # Memory (normal)
│       └── berger_zero_faulty_memory.v     # Memory with fault injection
│
├── tb/
│   └── berger_zero_tb.v                    # Testbench with functional scenarios
│
├── images/
│   ├── berger_zero_memory.png              # Diagram of normal memory
│   └── berger_zero_faulty_memory.png       # Diagram with unidirectional fault injection
│
└── README.md
```

---

## 🧠 Architecture Diagrams

### ✅ Berger B0 Memory


### ✅ Berger B0 Faulty Memory


---

## 🔩 Key Modules

---

## ✅ Features Tested


---

## 🚀 Future Extensions


---

## 🛠️ Usage (Vivado)

1. Open Vivado and create a new project
2. Add all files from `src/berger_zero/` as sources
3. Add `berger_zero_tb.v` from `tb/` as simulation source
4. Run simulation to observe correction behavior
5. Optionally, use waveform viewer to inspect correction

---

## 📜 License

Licensed under the **MIT License** – free to use, modify, and distribute.

---

## 🤝 Contributions

Pull requests, feature additions, and bug reports are welcome.
Let us know if you'd like to contribute diagrams, testbenches, or extensions!

