#[derive(Debug)]
pub struct ChessPosition(i32, i32);

#[derive(Debug)]
pub struct Queen(ChessPosition);

fn on_board(n: i32) -> bool {
    if n >= 0 && n <= 7 {
        true
    } else {
        false
    }
}

impl ChessPosition {
    pub fn new(rank: i32, file: i32) -> Option<Self> {
        match (on_board(rank), on_board(file)) {
            (true, true) => Some(Self(rank, file)),
            _ => None,
        }
    }
}

impl Queen {
    pub fn new(p: ChessPosition) -> Self {
        Self(ChessPosition::new(p.0, p.1).unwrap())
    }

    pub fn can_attack(&self, other: &Queen) -> bool {
        match (self, other) {
            (q1, q2) if q1.0 .0 == q2.0 .0 => true,
            (q1, q2) if q1.0 .1 == q2.0 .1 => true,
            (q1, q2) if (q1.0 .0 - q2.0 .0).abs() == (q1.0 .1 - q2.0 .1).abs() => true,
            _ => false,
        }
    }
}
