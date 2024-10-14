# Kotlin Compiler

## Introduction

brief overview
what parts of kotlin are covered / not covered
langs used
systems used (alex, happy, etc)

## Table of Contents

- [Kotlin Compiler](#kotlin-compiler)
  - [Introduction](#introduction)
  - [Table of Contents](#table-of-contents)
  - [Features](#features)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Structure](#structure)
  - [Testing](#testing)
  - [Notes for the Devs](#notes-for-the-devs)

## Features

lexical analysis, parsing, semantic analysis, code gen, etc

## Prerequisites

alex v.3.4 or above , happy ..., etc

## Installation

explain how to clone from github and setup environment
explain how to install any dependencies

## Usage

explain how to copile and run

## Structure

```paintext
Kotlin Compiler
├── README.md
├── src
│   ├── Lexer.hs
│   ├── Lexer.x
│   ├── Main.hs
│   ├── Parser.hs
│   ├── Parser.y
│   └── Test.hs
└── tests
    ├── input1.txt
    ├── ...
    ├── output1.txt
    └── ...
```

## Testing

explain the tests used
explain how to run tests
explain how to add tests (dont forget to mention that the variable `tests` in `/tests` needs to be updated)

## Notes for the Devs

convert this file to **pdf** before turning the project in
