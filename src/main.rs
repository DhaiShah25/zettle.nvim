use std::io::BufRead;

fn main() {
    println!("{{");
    let dir = std::env::args().nth(1).unwrap_or_else(|| "~/vault".into());
    for entry in ignore::Walk::new(dir)
        .filter_map(Result::ok)
        .filter_map(|e| {
            e.file_type()
                .and_then(|a| if a.is_file() { Some(e) } else { None })
        })
    {
        let path = entry.path();
        let Ok(file) = std::fs::File::open(path) else {
            continue;
        };

        let reader = std::io::BufReader::new(file);
        let Some(line) = reader
            .lines()
            .filter_map(Result::ok)
            .find(|line| line.starts_with("# "))
        else {
            continue;
        };
        println!(
            "\"{}\" = \"{}\"",
            line.strip_prefix("# ").unwrap(),
            path.display()
        );
    }
    println!("}}");
}
