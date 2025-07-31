const OFFSETS: [(i32, i32); 8] = [
    (-1, -1),
    (-1, 0),
    (-1, 1),
    (0, -1),
    (0, 1),
    (1, -1),
    (1, 0),
    (1, 1),
];

struct Board<'a> {
    width: usize,
    height: usize,
    squares: Vec<&'a [u8]>,
}

fn is_mine(square: &u8) -> bool {
    *square == b'*'
}

fn count_adjacent(board: &Board, x: usize, y: usize) -> usize {
    OFFSETS.iter().fold(0, |acc, (offset_x, offset_y)| {
        let column_index = x as i32 + offset_x;
        let row_index = y as i32 + offset_y;

        if column_index >= 0
            && column_index < board.width as i32
            && row_index >= 0
            && row_index < board.height as i32
        {
            let target_x = column_index as usize;
            let target_y = row_index as usize;
            let contents = &board.squares[target_y][target_x];
            if is_mine(contents) {
                acc + 1
            } else {
                acc
            }
        } else {
            acc
        }
    })
}

impl<'a> Board<'a> {
    fn init(minefield: &'a [&'a str]) -> Self {
        let height = minefield.len();
        let width = minefield.first().map_or(0, |row| row.len());
        let squares = minefield
            .iter()
            .map(|line| line.as_bytes())
            .collect::<Vec<&[u8]>>();

        Self {
            width,
            height,
            squares,
        }
    }

    fn sweep(&self) -> Vec<String> {
        self.squares
            .iter()
            .enumerate()
            .map(|(y, row)| {
                row.iter()
                    .enumerate()
                    .map(|(x, square)| {
                        if is_mine(square) {
                            String::from("*")
                        } else {
                            let count = count_adjacent(self, x, y);
                            if count > 0 {
                                count.to_string()
                            } else {
                                String::from(" ")
                            }
                        }
                    })
                    .collect::<Vec<String>>()
                    .join("")
            })
            .collect::<Vec<_>>()
    }
}

pub fn annotate(minefield: &[&str]) -> Vec<String> {
    Board::init(minefield).sweep()
}
