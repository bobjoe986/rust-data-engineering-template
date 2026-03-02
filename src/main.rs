use std::env;
use std::path::Path;

fn main() {
    let dir_arg = env::args().nth(1).unwrap_or_else(|| {
        eprintln!("Usage: cargo run -- <directory>");
        std::process::exit(1);
    });

    let root = Path::new(&dir_arg);
    if let Err(message) = dirsearch::validate_directory(root) {
        eprintln!("Error: {}", message);
        std::process::exit(1);
    }

    for (path, size) in dirsearch::find_json_files(root) {
        println!("{}\t{} bytes", path.display(), size);
    }
}
