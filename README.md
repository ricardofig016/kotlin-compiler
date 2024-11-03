# Kotlin Compiler

This project was developed for the Compilers (CC3001) course at the Faculty of Sciences of the University of Porto (FCUP). It is a compiler for a previosly defined subset of the Kotlin programming language, explained in depth in the [Coverage](#coverage) section.

The entire compiler is implemented in Haskell, using two key tools: **Alex** and **Happy**. Their roles and applications within the project are covered in detail in the [Tools](#tools) section.

## Table of Contents

- [Kotlin Compiler](#kotlin-compiler)
  - [Table of Contents](#table-of-contents)
  - [Features](#features)
  - [Coverage](#coverage)
  - [Tools](#tools)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Project Structure](#project-structure)
  - [Notes for the Devs](#notes-for-the-devs)

## Features

- **Lexical Analysis**: The compiler's lexical analysis scans the Kotlin source code and converts it into a sequence of tokens, representing elements such as keywords, identifiers, literals, and operators. This step breaks down the code into manageable components for subsequent stages.

- **Parsing**: In the parsing phase, the compiler processes the tokens generated during lexical analysis to construct an abstract syntax tree, which reflects the hierarchical structure of the code according to the subset's grammar. This tree enables the compiler to understand the nested relationships among expressions, statements, and blocks.

<!-- - **Semantic Analysis**: Semantic analysis ensures the logical correctness of the syntax tree. This phase includes type checking, verification of variable declarations, and validation of proper usage for expressions and operators within the Kotlin subset. It catches errors that are beyond the reach of parsing alone.

- **Code Generation**: The code generation phase translates the validated syntax tree into an intermediate representation or target code, producing output that represents the original Kotlin logic within the defined subset and is suitable for execution. -->

## Coverage

The compiler processes Kotlin code with the following features: arithmetic expressions, boolean expressions, the `print` and `readln` standard functions, variable declarations, assignments, conditional expressions (including `if` and `if-else` statements), and `while` loops.

We do not support function declarations, imports, or external libraries, nor do we handle object-oriented constructs such as classes or interfaces. Consequently, each file compiled with this tool must start with a `main` function declaration, which serves as the sole entry point for all executable code. This `main` function cannot accept parameters, and all code in the file must be contained within it.

## Tools

- **Alex** is a lexer generator that processes source code into tokens, capturing individual language elements like keywords, identifiers, and symbols.

- **Happy** is a parser generator that constructs the syntax tree from the tokens Alex generated, allowing us to validate and interpret the structure of Kotlin code within the defined subset.

Together, Alex and Happy create a cohesive compilation pipeline that translates Kotlin code into an intermediate form, ready for further analysis and compilation.

## Prerequisites

- Alex v.3.4.0.1
- Happy v.1.20.1.1
- GHC (Glasgow Haskell Compiler)

## Installation

1. Clone the repository from GitHub:

   ```sh
   git clone https://github.com/ricardofig016/kotlin-compiler
   cd kotlin-compiler
   ```

<!-- 2. Install the dependencies:

   ```sh
   cabal update
   cabal install alex happy
   ``` -->

## Usage

explain how to copile and run

## Project Structure

```paintext
Kotlin Compiler
├── README.md
├── inputs
│   ├── input1.kt
│   ├── input2.kt
├── output.txt
├── src
│   ├── Lexer.hs
│   ├── Lexer.x
│   ├── Main.hs
│   ├── Parser.hs
│   └── Parser.y
```

## Notes for the Devs

convert this file to **pdf** before turning the project in
