#[derive(Debug)]
struct Coord {
    x: i32,
    y: i32,
}

#[derive(Debug)]
struct Square {
    coord: Coord,
    has_mine: bool,
}

#[derive(Debug)]
struct Board {
    cols: i32,
    rows: i32,
    squares: Vec<Square>,
}

impl Board {
    pub fn create(minefield: &[&str]) -> Board {
        let cols = minefield.len();
        let rows = match minefield.get(0) {
            Some(line) => line.len(),
            _ => 0,
        };

        let squares: Vec<Square> = minefield
            .iter()
            .enumerate()
            .map(|(row, line)| {
                println!("Mapping over row {}, contents: {}", row, line);
                let symbols: Vec<char> = line.chars().collect();
                symbols
                    .iter()
                    .enumerate()
                    .map(|(col, sym)| {
                        let coord = Coord {
                            x: row as i32,
                            y: col as i32,
                        };

                        let has_mine = *sym == '*';

                        println!("Coordinate {:?}, has mine? {}", coord, has_mine);

                        Square { coord, has_mine }
                    })
                    .collect::<Vec<_>>()
            })
            .collect::<Vec<_>>()
            .into_iter()
            .flatten()
            .collect();

        Self {
            cols: cols as i32,
            rows: rows as i32,
            squares,
        }
    }

    pub fn count_mines(&self) -> Vec<String> {
        let checks = [
            (-1, -1),
            (-1, 0),
            (-1, 1),
            (0, -1),
            (0, 0),
            (0, 1),
            (1, -1),
            (1, 0),
            (1, 1),
        ];

        let mut rows: Vec<String> = vec![];

        for i in 0..self.rows {
            let mut row: Vec<char> = vec![];

            for j in 0..self.cols {
                let cur_coord = Coord { x: i, y: j };
                let num_mines = checks.iter().fold(0, |acc, (offset_x, offset_y)| {
                    match self.squares.iter().find(|s| {
                        s.coord.x == cur_coord.x + offset_x && s.coord.y == cur_coord.y + offset_y
                    }) {
                        Some(square) => {
                            if square.has_mine {
                                acc + 1
                            } else {
                                acc
                            }
                        }
                        None => acc,
                    }
                });

                let ch: char = if num_mines > 0 { num_mines.into() } else { ' ' };

                row.push(ch);
            }

            rows.push(row.iter().collect());
        }

        rows
    }
}

pub fn annotate(minefield: &[&str]) -> Vec<String> {
    println!("Running!");
    let board = Board::create(minefield);
    println!("Board: {:?}", board);
    let mines = board.count_mines();
    println!("Mines: {:?}", mines);

    mines
}
