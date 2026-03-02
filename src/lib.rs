use std::fs;
use std::path::{Path, PathBuf};

pub fn validate_directory(path: &Path) -> Result<(), String> {
    if path.is_dir() {
        Ok(())
    } else {
        Err(format!(
            "'{}' is not a directory or cannot be accessed.",
            path.display()
        ))
    }
}

pub fn find_json_files(root: &Path) -> Vec<(PathBuf, u64)> {
    let mut matches = Vec::new();
    let mut stack = vec![root.to_path_buf()];

    while let Some(current_dir) = stack.pop() {
        let entries = match fs::read_dir(&current_dir) {
            Ok(entries) => entries,
            Err(err) => {
                eprintln!("Warning: could not read '{}': {}", current_dir.display(), err);
                continue;
            }
        };

        for entry_result in entries {
            let entry = match entry_result {
                Ok(entry) => entry,
                Err(err) => {
                    eprintln!("Warning: could not read a directory entry: {}", err);
                    continue;
                }
            };

            let path = entry.path();
            let file_type = match entry.file_type() {
                Ok(file_type) => file_type,
                Err(err) => {
                    eprintln!("Warning: could not determine type for '{}': {}", path.display(), err);
                    continue;
                }
            };

            if file_type.is_dir() {
                stack.push(path);
                continue;
            }

            if file_type.is_file() && is_json_file(&path) {
                match entry.metadata() {
                    Ok(metadata) => matches.push((path, metadata.len())),
                    Err(err) => eprintln!(
                        "Warning: could not read metadata for '{}': {}",
                        path.display(),
                        err
                    ),
                }
            }
        }
    }

    matches
}

pub fn is_json_file(path: &Path) -> bool {
    path.extension()
        .and_then(|ext| ext.to_str())
        .map(|ext| ext.eq_ignore_ascii_case("json"))
        .unwrap_or(false)
}
