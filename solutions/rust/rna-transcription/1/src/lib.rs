#[derive(Debug, PartialEq, Eq)]
pub struct Dna(pub String);

#[derive(Debug, PartialEq, Eq)]
pub struct Rna(pub String);

const VALID_DNA: [char; 4] = ['G', 'C', 'T', 'A'];
const VALID_RNA: [char; 4] = ['C', 'G', 'A', 'U'];

fn any_invalid(input: &str, test: &[char]) -> Result<(), usize> {
    let first_invalid = input.chars().enumerate().find(|(_, c)| !test.contains(c));

    if let Some((index, _)) = first_invalid {
        Err(index)
    } else {
        Ok(())
    }
}

fn dna_to_rna(nucleotide: char) -> char {
    match nucleotide {
        'G' => 'C',
        'C' => 'G',
        'T' => 'A',
        'A' => 'U',
        _ => panic!("We discovered a new nucleotide!"),
    }
}

impl Dna {
    pub fn new(dna: &str) -> Result<Dna, usize> {
        any_invalid(dna, &VALID_DNA)?;
        Ok(Self(dna.to_owned()))
    }

    pub fn into_rna(&self) -> Rna {
        Rna::new(&self.0.chars().map(dna_to_rna).collect::<String>()).unwrap()
    }
}

impl Rna {
    pub fn new(rna: &str) -> Result<Rna, usize> {
        any_invalid(rna, &VALID_RNA)?;
        Ok(Self(rna.to_owned()))
    }
}
