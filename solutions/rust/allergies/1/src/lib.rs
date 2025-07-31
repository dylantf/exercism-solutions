pub struct Allergies {
    score: u32,
}

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
pub enum Allergen {
    Eggs,
    Peanuts,
    Shellfish,
    Strawberries,
    Tomatoes,
    Chocolate,
    Pollen,
    Cats,
}

impl Allergies {
    pub fn new(score: u32) -> Self {
        Self { score }
    }

    pub fn is_allergic_to(&self, allergen: &Allergen) -> bool {
        use Allergen::*;

        let points = match allergen {
            Eggs => 1,
            Peanuts => 2,
            Shellfish => 4,
            Strawberries => 8,
            Tomatoes => 16,
            Chocolate => 32,
            Pollen => 64,
            Cats => 128,
        };

        self.score & points != 0
    }

    pub fn allergies(&self) -> Vec<Allergen> {
        use Allergen::*;

        let allergens = vec![
            Eggs,
            Peanuts,
            Shellfish,
            Strawberries,
            Tomatoes,
            Chocolate,
            Pollen,
            Cats,
        ];

        allergens
            .iter()
            .filter(|a| self.is_allergic_to(a))
            .copied()
            .collect()
    }
}
