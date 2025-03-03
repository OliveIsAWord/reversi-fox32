#!/usr/bin/env rust-script

use std::{io::Write, fs::{read_to_string, File}};

let lines: Vec<_> = read_to_string("fox32.def.olea")?.lines().map(str::to_owned).collect();
let mut out = File::create("binding_addresses.asm")?;
for (i, address) in lines.iter().enumerate().filter_map(|(i, line)| line.strip_prefix("##").map(|l|(i, l.trim()))) {
    let name = lines[i + 1].strip_prefix("extern fn ").unwrap().split("(").next().unwrap().to_ascii_uppercase();
    writeln!(out, "const {name}: {address}")?;
}
