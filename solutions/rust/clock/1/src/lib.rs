#[derive(Debug, PartialEq, PartialOrd)]
pub struct Clock {
    pub hours: i32,
    pub minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        Self { hours, minutes }
    }

    pub fn from_minutes(minutes: &i32) -> Self {
        Self {
            hours: minutes / 60,
            minutes: minutes % 60,
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let total_minutes = convert_to_minutes(self) + minutes;
        Clock::from_minutes(&total_minutes)
    }

    pub fn to_string(&self) -> String {
        let hours = format_digits(&self.hours);
        let minutes = format_digits(&self.minutes);
        format!("{hours}:{minutes}")
    }
}

fn convert_to_minutes(clock: &Clock) -> i32 {
    clock.hours * 60 + clock.minutes
}

fn format_digits(digits: &i32) -> String {
    if digits >= &10 {
        return digits.to_string();
    }

    format!("0{}", digits)
}
