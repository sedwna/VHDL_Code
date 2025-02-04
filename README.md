---

# Digital Design Repository 🖥️

This repository contains a collection of **VHDL modules** for **behavioral** and **structural** digital design. It includes various components such as **counters**, **registers**, **RAM/ROM blocks**, **adders**, **comparators**, and more. These modules are designed to be modular, reusable, and easy to integrate into larger digital systems.

---

## Table of Contents

1. [Features](#features)
2. [Repository Structure](#repository-structure)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Modules Overview](#modules-overview)
6. [Contributing](#contributing)

---

## Features ✨

- **Behavioral and Structural Designs**: Includes both high-level behavioral descriptions and low-level structural implementations.
- **Modular and Reusable**: Each module is designed to be standalone and easily integrable into larger projects.
- **Wide Range of Components**:
  - **Counters**: 4-bit and N-bit counters, up/down counters.
  - **Registers**: PIPO, PISO, SIPO, and shift registers.
  - **Memory Blocks**: Block RAM, distributed RAM, ROM.
  - **Arithmetic Units**: Adders, subtractors, comparators.
  - **State Machines**: Basic state machine implementations.
- **Testbenches**: Includes testbenches for most modules to verify functionality.

---

## Repository Structure 📂

```
Digital_Design_Repository/
├── behavioral/               # Behavioral VHDL/Verilog modules
│   ├── block_ram/            # Block RAM implementation
│   ├── block_ram_bidirectional/  # Bidirectional block RAM
│   ├── counter_4_bit/        # 4-bit counter
│   ├── counter_n_bit/        # N-bit counter
│   ├── d_flip_flop/          # D Flip-Flop
│   ├── distributed_ram/      # Distributed RAM
│   ├── left_PIPO_4_bit/      # 4-bit left parallel-in parallel-out register
│   ├── right_PISO_n_bit/     # N-bit right parallel-in serial-out register
│   └── ...                   # Other behavioral modules
├── structural/               # Structural VHDL/Verilog modules
│   ├── adder_n_bit/          # N-bit adder
│   ├── comparator_n_bit/     # N-bit comparator
│   ├── d_latch/              # D Latch
│   ├── full_adder/           # Full adder
│   ├── mux2_1/               # 2-to-1 multiplexer
│   └── ...                   # Other structural modules
├── dataflow/                 # Dataflow designs
│   └── tri_state_buffer/     # Tri-state buffer
├── _prj/                     # Project files
│   └── Multiplier_4_bit/     # 4-bit multiplier project
├── README.md                 # Project documentation
└── LICENSE                   # License file
```

---

## Installation 🛠️

### Prerequisites

- A VHDL/Verilog simulator (e.g., ModelSim, Xilinx Vivado, or Quartus).
- Basic knowledge of digital design and hardware description languages (VHDL/Verilog).

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/sedwna/vhdl_code.git
   ```

2. Open the desired module in your VHDL simulator.

3. Compile and simulate the module using the provided testbenches.

---

## Usage 🚀

### Running a Module

1. Navigate to the module folder:
   ```bash
   cd behavioral/counter_4_bit
   ```

2. Open the module and testbench in your simulator.

3. Compile and simulate the design to verify its functionality.

### Example: 4-Bit Counter

1. Open the `counter_4_bit` module in your simulator.
2. Compile the module and its testbench.
3. Run the simulation to observe the counter's behavior.

---

## Modules Overview 📋

### Behavioral Modules

| Module Name                  | Description                                      |
|------------------------------|--------------------------------------------------|
| `block_ram`                  | Block RAM implementation.                        |
| `block_ram_bidirectional`    | Bidirectional block RAM.                         |
| `counter_4_bit`              | 4-bit counter.                                   |
| `counter_n_bit`              | N-bit counter.                                   |
| `d_flip_flop`                | D Flip-Flop implementation.                      |
| `left_PIPO_4_bit`            | 4-bit left parallel-in parallel-out register.    |
| `right_PISO_n_bit`           | N-bit right parallel-in serial-out register.     |

### Structural Modules

| Module Name                  | Description                                      |
|------------------------------|--------------------------------------------------|
| `adder_n_bit`                | N-bit adder.                                     |
| `comparator_n_bit`           | N-bit comparator.                                |
| `d_latch`                    | D Latch implementation.                          |
| `full_adder`                 | Full adder.                                      |
| `mux2_1`                     | 2-to-1 multiplexer.                              |

### Dataflow Modules

| Module Name                  | Description                                      |
|------------------------------|--------------------------------------------------|
| `tri_state_buffer`           | Tri-state buffer implementation.                 |

---

## Contributing 🤝

We welcome contributions to this repository! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeatureName`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push your changes to your fork (`git push origin feature/YourFeatureName`).
5. Open a Pull Request.

---

## Acknowledgments 🙏

- **Open Source Community**: For providing valuable resources and tools.
- **Digital Design Enthusiasts**: For inspiring this collection of modules.

## Contact

For questions or feedback, feel free to reach out:

- **Email**: [sajaddehqan2002@gmail.com]
- **GitHub**: [[My GitHub Profile](https://github.com/sedwna)]
- **Project Repository**: [[ChatterAI GitHub Repo](https://github.com/sedwna/vhdl_code)]

---

