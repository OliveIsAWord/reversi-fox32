#!/usr/bin/env rust-script

let args: Vec<_> = std::env::args().collect();
assert_eq!(args.len(), 2);
let lines: Vec<_> = std::fs::read_to_string(&args[1])?.lines().map(str::to_owned).collect();
for (i, address) in lines.iter().enumerate().filter_map(|(i, line)| line.strip_prefix("##").map(|l|(i, l.trim()))) {
    let name = lines[i + 1].strip_prefix("extern fn ").unwrap().split("(").next().unwrap().to_ascii_uppercase();
    println!("const {name}: {address}");
}
