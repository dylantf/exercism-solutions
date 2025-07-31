// Copy all the things! Just get tests passing...
#[derive(Debug)]
pub struct HighScores(pub Vec<u32>);

impl HighScores {
    pub fn new(scores: &[u32]) -> Self {
        HighScores(scores.into())
    }

    pub fn scores(&self) -> &[u32] {
        self.0.as_slice()
    }

    pub fn latest(&self) -> Option<u32> {
        self.0.last().copied()
    }

    pub fn personal_best(&self) -> Option<u32> {
        let mut all_scores = self.0.clone();
        all_scores.sort_unstable();
        all_scores.last().copied()
    }

    pub fn personal_top_three(&self) -> Vec<u32> {
        let mut all_scores = self.0.clone();
        all_scores.sort_unstable();
        all_scores.reverse();
        all_scores.iter().take(3).copied().collect()
    }
}
