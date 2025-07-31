use std::fmt;

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct Clock {
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        Clock {
            minutes: ((hours * 60) + minutes),
        }
        .normalize()
    }

    // Converts raw minutes into clock-minutes (max 24h)
    fn normalize(&self) -> Self {
        Clock {
            minutes: ((1440 + (&self.minutes % 1440)) % 1440),
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Clock {
            minutes: self.minutes + minutes,
        }
        .normalize()
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.minutes / 60, self.minutes % 60)
    }
}
