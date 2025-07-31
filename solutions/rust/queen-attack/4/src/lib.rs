#[derive(Debug)]
pub struct ChessPosition {
    rank: i32,
    file: i32,
}

#[derive(Debug)]
pub struct Queen(ChessPosition);

fn on_board(n: i32) -> bool {
    n >= 0 && n <= 7
}

impl ChessPosition {
    pub fn new(rank: i32, file: i32) -> Option<Self> {
        if on_board(rank) && on_board(file) {
            Some(Self { rank, file })
        } else {
            None
        }
    }
}

impl Queen {
    pub fn new(p: ChessPosition) -> Self {
        Self(ChessPosition::new(p.rank, p.file).unwrap())
    }

    pub fn can_attack(&self, other: &Queen) -> bool {
        match (self, other) {
            (q1, q2) if q1.0.rank == q2.0.rank => true,
            (q1, q2) if q1.0.file == q2.0.file => true,
            (q1, q2) if (q1.0.rank - q2.0.rank).abs() == (q1.0.file - q2.0.file).abs() => true,
            _ => false,
        }
    }
}
